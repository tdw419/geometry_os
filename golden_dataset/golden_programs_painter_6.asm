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
;   r2 = cursor X (starts at 128)
;   r11 = cursor Y (starts at 128)
;   r4 = key port address (0xFFFF)
;   r14 = color register
;   r7 = zero constant (0)
;   r8 = one constant (1)
;   r16 = four constant (4)
;   r17 = saved key address (0x0300)
;   r18 = max paints (5)
;   r15  = paint counter
;   r10  = temp
;   r13  = temp
;   r5  = temp
;   r12  = color cycling offset

; ── Constants ──────────────────────────────────────────────────
    LDI r2, 128         ; cursor X
    LDI r11, 128         ; cursor Y
    LDI r4, 0xFFFF      ; key port address
    LDI r14, 0x00FFFF    ; cursor color (cyan)
    LDI r7, 0           ; zero
    LDI r8, 1           ; one
    LDI r16, 4           ; step size
    LDI r17, 0x0300      ; saved key RAM address
    LDI r18, 5           ; max paints before halt
    LDI r15, 0            ; paint counter
    LDI r12, 0            ; color cycling offset

; ── Store PAINTER signature at RAM[0x0200..0x0207] ─────────
    LDI r10, 0x0200
    LDI r13, 80           ; P
    STORE r10, r13
    ADD r10, r8
    LDI r13, 65           ; A
    STORE r10, r13
    ADD r10, r8
    LDI r13, 73           ; I
    STORE r10, r13
    ADD r10, r8
    LDI r13, 78           ; N
    STORE r10, r13
    ADD r10, r8
    LDI r13, 84           ; T
    STORE r10, r13
    ADD r10, r8
    LDI r13, 69           ; E
    STORE r10, r13
    ADD r10, r8
    LDI r13, 82           ; R
    STORE r10, r13

; ── Draw initial cursor pixel ────────────────────────────────
    PSET r2, r11, r14

; ── Main poll loop ────────────────────────────────────────────
poll:
    LOAD r10, r4         ; r10 = key from port
    CMP r10, r7          ; r1 = 0 if key == 0
    JZ r1, poll          ; no key -> go back to poll

    ; Key pressed -- save key to RAM, then clear port
    STORE r17, r10        ; save key at RAM[0x0300]
    LDI r10, 0
    STORE r4, r10        ; clear keyboard port

    ; Reload saved key
    LOAD r10, r17

; ── Dispatch on key value ────────────────────────────────────

    ; Check for W (87 = up)
    LDI r13, 87
    CMP r10, r13
    JNZ r1, check_s
    SUB r11, r16         ; Y -= 4
    ; Clamp Y >= 0 (if Y underflowed to large value, fix it)
    LDI r13, 252
    CMP r11, r13
    JNZ r1, move_done
    LDI r11, 0
    JMP move_done

check_s:
    ; Check for S (83 = down)
    LDI r13, 83
    CMP r10, r13
    JNZ r1, check_a
    ADD r11, r16         ; Y += 4
    ; Clamp Y <= 252
    LDI r13, 253
    CMP r11, r13
    JNZ r1, move_done
    LDI r11, 252
    JMP move_done

check_a:
    ; Check for A (65 = left)
    LDI r13, 65
    CMP r10, r13
    JNZ r1, check_d
    SUB r2, r16         ; X -= 4
    ; Clamp X >= 0
    LDI r13, 252
    CMP r2, r13
    JNZ r1, move_done
    LDI r2, 0
    JMP move_done

check_d:
    ; Check for D (68 = right)
    LDI r13, 68
    CMP r10, r13
    JNZ r1, check_space
    ADD r2, r16         ; X += 4
    ; Clamp X <= 252
    LDI r13, 253
    CMP r2, r13
    JNZ r1, move_done
    LDI r2, 252
    JMP move_done

check_space:
    ; Check for Space (32 = paint)
    LDI r13, 32
    CMP r10, r13
    JNZ r1, check_q

    ; Compute paint color
    ; Use paint_counter * 50000 + 0xFF
    ; This cycles through colors as counter grows
    LDI r13, 50000
    MUL r13, r15           ; r13 = paint_counter * 50000
    LDI r5, 0xFF
    OR r13, r5            ; ensure some blue channel

    PSET r2, r11, r13    ; paint pixel

    ; Increment paint counter
    ADD r15, r8
    ADD r12, r8

    ; Check if done
    CMP r15, r18
    JNZ r1, paint_done
    HALT                 ; reached max paints

paint_done:
    JMP poll

check_q:
    ; Check for Q (81 = quit)
    LDI r13, 81
    CMP r10, r13
    JNZ r1, unknown_key
    HALT                 ; quit on Q

unknown_key:
    JMP poll             ; ignore unknown keys

move_done:
    PSET r2, r11, r14   ; draw cursor at new position
    JMP poll
