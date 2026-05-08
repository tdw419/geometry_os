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
;   r0 = cursor X (starts at 128)
;   r2 = cursor Y (starts at 128)
;   r15 = key port address (0xFFFF)
;   r7 = color register
;   r14 = zero constant (0)
;   r9 = one constant (1)
;   r16 = four constant (4)
;   r17 = saved key address (0x0300)
;   r18 = max paints (5)
;   r4  = paint counter
;   r3  = temp
;   r12  = temp
;   r5  = temp
;   r8  = color cycling offset

; ── Constants ──────────────────────────────────────────────────
    LDI r0, 128         ; cursor X
    LDI r2, 128         ; cursor Y
    LDI r15, 0xFFFF      ; key port address
    LDI r7, 0x00FFFF    ; cursor color (cyan)
    LDI r14, 0           ; zero
    LDI r9, 1           ; one
    LDI r16, 4           ; step size
    LDI r17, 0x0300      ; saved key RAM address
    LDI r18, 5           ; max paints before halt
    LDI r4, 0            ; paint counter
    LDI r8, 0            ; color cycling offset

; ── Store PAINTER signature at RAM[0x0200..0x0207] ─────────
    LDI r3, 0x0200
    LDI r12, 80           ; P
    STORE r3, r12
    ADD r3, r9
    LDI r12, 65           ; A
    STORE r3, r12
    ADD r3, r9
    LDI r12, 73           ; I
    STORE r3, r12
    ADD r3, r9
    LDI r12, 78           ; N
    STORE r3, r12
    ADD r3, r9
    LDI r12, 84           ; T
    STORE r3, r12
    ADD r3, r9
    LDI r12, 69           ; E
    STORE r3, r12
    ADD r3, r9
    LDI r12, 82           ; R
    STORE r3, r12

; ── Draw initial cursor pixel ────────────────────────────────
    PSET r0, r2, r7

; ── Main poll loop ────────────────────────────────────────────
poll:
    LOAD r3, r15         ; r3 = key from port
    CMP r3, r14          ; r11 = 0 if key == 0
    JZ r11, poll          ; no key -> go back to poll

    ; Key pressed -- save key to RAM, then clear port
    STORE r17, r3        ; save key at RAM[0x0300]
    LDI r3, 0
    STORE r15, r3        ; clear keyboard port

    ; Reload saved key
    LOAD r3, r17

; ── Dispatch on key value ────────────────────────────────────

    ; Check for W (87 = up)
    LDI r12, 87
    CMP r3, r12
    JNZ r11, check_s
    SUB r2, r16         ; Y -= 4
    ; Clamp Y >= 0 (if Y underflowed to large value, fix it)
    LDI r12, 252
    CMP r2, r12
    JNZ r11, move_done
    LDI r2, 0
    JMP move_done

check_s:
    ; Check for S (83 = down)
    LDI r12, 83
    CMP r3, r12
    JNZ r11, check_a
    ADD r2, r16         ; Y += 4
    ; Clamp Y <= 252
    LDI r12, 253
    CMP r2, r12
    JNZ r11, move_done
    LDI r2, 252
    JMP move_done

check_a:
    ; Check for A (65 = left)
    LDI r12, 65
    CMP r3, r12
    JNZ r11, check_d
    SUB r0, r16         ; X -= 4
    ; Clamp X >= 0
    LDI r12, 252
    CMP r0, r12
    JNZ r11, move_done
    LDI r0, 0
    JMP move_done

check_d:
    ; Check for D (68 = right)
    LDI r12, 68
    CMP r3, r12
    JNZ r11, check_space
    ADD r0, r16         ; X += 4
    ; Clamp X <= 252
    LDI r12, 253
    CMP r0, r12
    JNZ r11, move_done
    LDI r0, 252
    JMP move_done

check_space:
    ; Check for Space (32 = paint)
    LDI r12, 32
    CMP r3, r12
    JNZ r11, check_q

    ; Compute paint color
    ; Use paint_counter * 50000 + 0xFF
    ; This cycles through colors as counter grows
    LDI r12, 50000
    MUL r12, r4           ; r12 = paint_counter * 50000
    LDI r5, 0xFF
    OR r12, r5            ; ensure some blue channel

    PSET r0, r2, r12    ; paint pixel

    ; Increment paint counter
    ADD r4, r9
    ADD r8, r9

    ; Check if done
    CMP r4, r18
    JNZ r11, paint_done
    HALT                 ; reached max paints

paint_done:
    JMP poll

check_q:
    ; Check for Q (81 = quit)
    LDI r12, 81
    CMP r3, r12
    JNZ r11, unknown_key
    HALT                 ; quit on Q

unknown_key:
    JMP poll             ; ignore unknown keys

move_done:
    PSET r0, r2, r7   ; draw cursor at new position
    JMP poll
