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
;   r3 = cursor X (starts at 128)
;   r11 = cursor Y (starts at 128)
;   r5 = key port address (0xFFFF)
;   r8 = color register
;   r13 = zero constant (0)
;   r4 = one constant (1)
;   r16 = four constant (4)
;   r17 = saved key address (0x0300)
;   r18 = max paints (5)
;   r9  = paint counter
;   r15  = temp
;   r6  = temp
;   r12  = temp
;   r1  = color cycling offset

; ── Constants ──────────────────────────────────────────────────
    LDI r3, 128         ; cursor X
    LDI r11, 128         ; cursor Y
    LDI r5, 0xFFFF      ; key port address
    LDI r8, 0x00FFFF    ; cursor color (cyan)
    LDI r13, 0           ; zero
    LDI r4, 1           ; one
    LDI r16, 4           ; step size
    LDI r17, 0x0300      ; saved key RAM address
    LDI r18, 5           ; max paints before halt
    LDI r9, 0            ; paint counter
    LDI r1, 0            ; color cycling offset

; ── Store PAINTER signature at RAM[0x0200..0x0207] ─────────
    LDI r15, 0x0200
    LDI r6, 80           ; P
    STORE r15, r6
    ADD r15, r4
    LDI r6, 65           ; A
    STORE r15, r6
    ADD r15, r4
    LDI r6, 73           ; I
    STORE r15, r6
    ADD r15, r4
    LDI r6, 78           ; N
    STORE r15, r6
    ADD r15, r4
    LDI r6, 84           ; T
    STORE r15, r6
    ADD r15, r4
    LDI r6, 69           ; E
    STORE r15, r6
    ADD r15, r4
    LDI r6, 82           ; R
    STORE r15, r6

; ── Draw initial cursor pixel ────────────────────────────────
    PSET r3, r11, r8

; ── Main poll loop ────────────────────────────────────────────
poll:
    LOAD r15, r5         ; r15 = key from port
    CMP r15, r13          ; r10 = 0 if key == 0
    JZ r10, poll          ; no key -> go back to poll

    ; Key pressed -- save key to RAM, then clear port
    STORE r17, r15        ; save key at RAM[0x0300]
    LDI r15, 0
    STORE r5, r15        ; clear keyboard port

    ; Reload saved key
    LOAD r15, r17

; ── Dispatch on key value ────────────────────────────────────

    ; Check for W (87 = up)
    LDI r6, 87
    CMP r15, r6
    JNZ r10, check_s
    SUB r11, r16         ; Y -= 4
    ; Clamp Y >= 0 (if Y underflowed to large value, fix it)
    LDI r6, 252
    CMP r11, r6
    JNZ r10, move_done
    LDI r11, 0
    JMP move_done

check_s:
    ; Check for S (83 = down)
    LDI r6, 83
    CMP r15, r6
    JNZ r10, check_a
    ADD r11, r16         ; Y += 4
    ; Clamp Y <= 252
    LDI r6, 253
    CMP r11, r6
    JNZ r10, move_done
    LDI r11, 252
    JMP move_done

check_a:
    ; Check for A (65 = left)
    LDI r6, 65
    CMP r15, r6
    JNZ r10, check_d
    SUB r3, r16         ; X -= 4
    ; Clamp X >= 0
    LDI r6, 252
    CMP r3, r6
    JNZ r10, move_done
    LDI r3, 0
    JMP move_done

check_d:
    ; Check for D (68 = right)
    LDI r6, 68
    CMP r15, r6
    JNZ r10, check_space
    ADD r3, r16         ; X += 4
    ; Clamp X <= 252
    LDI r6, 253
    CMP r3, r6
    JNZ r10, move_done
    LDI r3, 252
    JMP move_done

check_space:
    ; Check for Space (32 = paint)
    LDI r6, 32
    CMP r15, r6
    JNZ r10, check_q

    ; Compute paint color
    ; Use paint_counter * 50000 + 0xFF
    ; This cycles through colors as counter grows
    LDI r6, 50000
    MUL r6, r9           ; r6 = paint_counter * 50000
    LDI r12, 0xFF
    OR r6, r12            ; ensure some blue channel

    PSET r3, r11, r6    ; paint pixel

    ; Increment paint counter
    ADD r9, r4
    ADD r1, r4

    ; Check if done
    CMP r9, r18
    JNZ r10, paint_done
    HALT                 ; reached max paints

paint_done:
    JMP poll

check_q:
    ; Check for Q (81 = quit)
    LDI r6, 81
    CMP r15, r6
    JNZ r10, unknown_key
    HALT                 ; quit on Q

unknown_key:
    JMP poll             ; ignore unknown keys

move_done:
    PSET r3, r11, r8   ; draw cursor at new position
    JMP poll
