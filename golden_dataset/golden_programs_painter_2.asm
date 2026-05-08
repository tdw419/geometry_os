; DESCRIPTION: This GeOS assembly code implements a simple pixel painting program that reads keyboard inputs to move a cursor and paint colored pixels on the screen. The program supports moving the cursor in four directions (up, down, left, right) by 4 pixels per input, painting a colored pixel at the cursor's position when the spacebar is pressed, and halting after 5 paint operations or upon receiving a 'Q' key input to quit.

; PAINTER: Read keyboard port, draw colored pixels where cursor is
;
; Controls:
;   W = move cursor up (by 4 pixels)
;   A = move cursor left (by 4 pixels)
;   S = move cursor down (by 4 pixels)
;   D = move cursor right (by 4 pixels)
;   Space = paint colored pixel at cursor position
;   Q = quit
;
; After 5 paint operations, the program halts.
;
; Register allocation:
;   r12 = cursor X (starts at 128)
;   r5 = cursor Y (starts at 128)
;   r11 = key port address (0xFFFF)
;   r1 = color register
;   r9 = zero constant (0)
;   r0 = one constant (1)
;   r16 = four constant (4)
;   r17 = saved key address (0x0300)
;   r18 = max paints (5)
;   r10  = paint counter
;   r15  = temp
;   r14  = temp
;   r4  = temp
;   r2  = color cycling offset

; ── Constants ──────────────────────────────────────────────────
    LDI r12, 128         ; cursor X
    LDI r5, 128         ; cursor Y
    LDI r11, 0xFFFF      ; key port address
    LDI r1, 0x00FFFF    ; cursor color (cyan)
    LDI r9, 0           ; zero
    LDI r0, 1           ; one
    LDI r16, 4           ; step size
    LDI r17, 0x0300      ; saved key RAM address
    LDI r18, 5           ; max paints before halt
    LDI r10, 0            ; paint counter
    LDI r2, 0            ; color cycling offset

; ── Store PAINTER signature at RAM[0x0200..0x0207] ─────────
    LDI r15, 0x0200
    LDI r14, 80           ; P
    STORE r15, r14
    ADD r15, r0
    LDI r14, 65           ; A
    STORE r15, r14
    ADD r15, r0
    LDI r14, 73           ; I
    STORE r15, r14
    ADD r15, r0
    LDI r14, 78           ; N
    STORE r15, r14
    ADD r15, r0
    LDI r14, 84           ; T
    STORE r15, r14
    ADD r15, r0
    LDI r14, 69           ; E
    STORE r15, r14
    ADD r15, r0
    LDI r14, 82           ; R
    STORE r15, r14

; ── Draw initial cursor pixel ────────────────────────────────
    PSET r12, r5, r1

; ── Main poll loop ────────────────────────────────────────────
poll:
    LOAD r15, r11         ; r15 = key from port
    CMP r15, r9          ; r13 = 0 if key == 0
    JZ r13, poll          ; no key -> go back to poll

    ; Key pressed -- save key to RAM, then clear port
    STORE r17, r15        ; save key at RAM[0x0300]
    LDI r15, 0
    STORE r11, r15        ; clear keyboard port

    ; Reload saved key
    LOAD r15, r17

; ── Dispatch on key value ────────────────────────────────────

    ; Check for W (87 = up)
    LDI r14, 87
    CMP r15, r14
    JNZ r13, check_s
    SUB r5, r16         ; Y -= 4
    ; Clamp Y >= 0 (if Y underflowed to large value, fix it)
    LDI r14, 252
    CMP r5, r14
    JNZ r13, move_done
    LDI r5, 0
    JMP move_done

check_s:
    ; Check for S (83 = down)
    LDI r14, 83
    CMP r15, r14
    JNZ r13, check_a
    ADD r5, r16         ; Y += 4
    ; Clamp Y <= 252
    LDI r14, 253
    CMP r5, r14
    JNZ r13, move_done
    LDI r5, 252
    JMP move_done

check_a:
    ; Check for A (65 = left)
    LDI r14, 65
    CMP r15, r14
    JNZ r13, check_d
    SUB r12, r16         ; X -= 4
    ; Clamp X >= 0
    LDI r14, 252
    CMP r12, r14
    JNZ r13, move_done
    LDI r12, 0
    JMP move_done

check_d:
    ; Check for D (68 = right)
    LDI r14, 68
    CMP r15, r14
    JNZ r13, check_space
    ADD r12, r16         ; X += 4
    ; Clamp X <= 252
    LDI r14, 253
    CMP r12, r14
    JNZ r13, move_done
    LDI r12, 252
    JMP move_done

check_space:
    ; Check for Space (32 = paint)
    LDI r14, 32
    CMP r15, r14
    JNZ r13, check_q

    ; Compute paint color
    ; Use paint_counter * 50000 + 0xFF
    ; This cycles through colors as counter grows
    LDI r14, 50000
    MUL r14, r10           ; r14 = paint_counter * 50000
    LDI r4, 0xFF
    OR r14, r4            ; ensure some blue channel

    PSET r12, r5, r14    ; paint pixel

    ; Increment paint counter
    ADD r10, r0
    ADD r2, r0

    ; Check if done
    CMP r10, r18
    JNZ r13, paint_done
    HALT                 ; reached max paints

paint_done:
    JMP poll

check_q:
    ; Check for Q (81 = quit)
    LDI r14, 81
    CMP r15, r14
    JNZ r13, unknown_key
    HALT                 ; quit on Q

unknown_key:
    JMP poll             ; ignore unknown keys

move_done:
    PSET r12, r5, r1   ; draw cursor at new position
    JMP poll
