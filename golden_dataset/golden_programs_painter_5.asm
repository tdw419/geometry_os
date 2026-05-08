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
;   r13 = cursor X (starts at 128)
;   r12 = cursor Y (starts at 128)
;   r4 = key port address (0xFFFF)
;   r7 = color register
;   r9 = zero constant (0)
;   r3 = one constant (1)
;   r16 = four constant (4)
;   r17 = saved key address (0x0300)
;   r18 = max paints (5)
;   r10  = paint counter
;   r14  = temp
;   r15  = temp
;   r11  = temp
;   r6  = color cycling offset

; ── Constants ──────────────────────────────────────────────────
    LDI r13, 128         ; cursor X
    LDI r12, 128         ; cursor Y
    LDI r4, 0xFFFF      ; key port address
    LDI r7, 0x00FFFF    ; cursor color (cyan)
    LDI r9, 0           ; zero
    LDI r3, 1           ; one
    LDI r16, 4           ; step size
    LDI r17, 0x0300      ; saved key RAM address
    LDI r18, 5           ; max paints before halt
    LDI r10, 0            ; paint counter
    LDI r6, 0            ; color cycling offset

; ── Store PAINTER signature at RAM[0x0200..0x0207] ─────────
    LDI r14, 0x0200
    LDI r15, 80           ; P
    STORE r14, r15
    ADD r14, r3
    LDI r15, 65           ; A
    STORE r14, r15
    ADD r14, r3
    LDI r15, 73           ; I
    STORE r14, r15
    ADD r14, r3
    LDI r15, 78           ; N
    STORE r14, r15
    ADD r14, r3
    LDI r15, 84           ; T
    STORE r14, r15
    ADD r14, r3
    LDI r15, 69           ; E
    STORE r14, r15
    ADD r14, r3
    LDI r15, 82           ; R
    STORE r14, r15

; ── Draw initial cursor pixel ────────────────────────────────
    PSET r13, r12, r7

; ── Main poll loop ────────────────────────────────────────────
poll:
    LOAD r14, r4         ; r14 = key from port
    CMP r14, r9          ; r5 = 0 if key == 0
    JZ r5, poll          ; no key -> go back to poll

    ; Key pressed -- save key to RAM, then clear port
    STORE r17, r14        ; save key at RAM[0x0300]
    LDI r14, 0
    STORE r4, r14        ; clear keyboard port

    ; Reload saved key
    LOAD r14, r17

; ── Dispatch on key value ────────────────────────────────────

    ; Check for W (87 = up)
    LDI r15, 87
    CMP r14, r15
    JNZ r5, check_s
    SUB r12, r16         ; Y -= 4
    ; Clamp Y >= 0 (if Y underflowed to large value, fix it)
    LDI r15, 252
    CMP r12, r15
    JNZ r5, move_done
    LDI r12, 0
    JMP move_done

check_s:
    ; Check for S (83 = down)
    LDI r15, 83
    CMP r14, r15
    JNZ r5, check_a
    ADD r12, r16         ; Y += 4
    ; Clamp Y <= 252
    LDI r15, 253
    CMP r12, r15
    JNZ r5, move_done
    LDI r12, 252
    JMP move_done

check_a:
    ; Check for A (65 = left)
    LDI r15, 65
    CMP r14, r15
    JNZ r5, check_d
    SUB r13, r16         ; X -= 4
    ; Clamp X >= 0
    LDI r15, 252
    CMP r13, r15
    JNZ r5, move_done
    LDI r13, 0
    JMP move_done

check_d:
    ; Check for D (68 = right)
    LDI r15, 68
    CMP r14, r15
    JNZ r5, check_space
    ADD r13, r16         ; X += 4
    ; Clamp X <= 252
    LDI r15, 253
    CMP r13, r15
    JNZ r5, move_done
    LDI r13, 252
    JMP move_done

check_space:
    ; Check for Space (32 = paint)
    LDI r15, 32
    CMP r14, r15
    JNZ r5, check_q

    ; Compute paint color
    ; Use paint_counter * 50000 + 0xFF
    ; This cycles through colors as counter grows
    LDI r15, 50000
    MUL r15, r10           ; r15 = paint_counter * 50000
    LDI r11, 0xFF
    OR r15, r11            ; ensure some blue channel

    PSET r13, r12, r15    ; paint pixel

    ; Increment paint counter
    ADD r10, r3
    ADD r6, r3

    ; Check if done
    CMP r10, r18
    JNZ r5, paint_done
    HALT                 ; reached max paints

paint_done:
    JMP poll

check_q:
    ; Check for Q (81 = quit)
    LDI r15, 81
    CMP r14, r15
    JNZ r5, unknown_key
    HALT                 ; quit on Q

unknown_key:
    JMP poll             ; ignore unknown keys

move_done:
    PSET r13, r12, r7   ; draw cursor at new position
    JMP poll
