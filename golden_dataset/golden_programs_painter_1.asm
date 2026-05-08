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
;   r7 = cursor X (starts at 128)
;   r13 = cursor Y (starts at 128)
;   r1 = key port address (0xFFFF)
;   r4 = color register
;   r15 = zero constant (0)
;   r9 = one constant (1)
;   r16 = four constant (4)
;   r17 = saved key address (0x0300)
;   r18 = max paints (5)
;   r6  = paint counter
;   r12  = temp
;   r2  = temp
;   r5  = temp
;   r3  = color cycling offset

; ── Constants ──────────────────────────────────────────────────
    LDI r7, 128         ; cursor X
    LDI r13, 128         ; cursor Y
    LDI r1, 0xFFFF      ; key port address
    LDI r4, 0x00FFFF    ; cursor color (cyan)
    LDI r15, 0           ; zero
    LDI r9, 1           ; one
    LDI r16, 4           ; step size
    LDI r17, 0x0300      ; saved key RAM address
    LDI r18, 5           ; max paints before halt
    LDI r6, 0            ; paint counter
    LDI r3, 0            ; color cycling offset

; ── Store PAINTER signature at RAM[0x0200..0x0207] ─────────
    LDI r12, 0x0200
    LDI r2, 80           ; P
    STORE r12, r2
    ADD r12, r9
    LDI r2, 65           ; A
    STORE r12, r2
    ADD r12, r9
    LDI r2, 73           ; I
    STORE r12, r2
    ADD r12, r9
    LDI r2, 78           ; N
    STORE r12, r2
    ADD r12, r9
    LDI r2, 84           ; T
    STORE r12, r2
    ADD r12, r9
    LDI r2, 69           ; E
    STORE r12, r2
    ADD r12, r9
    LDI r2, 82           ; R
    STORE r12, r2

; ── Draw initial cursor pixel ────────────────────────────────
    PSET r7, r13, r4

; ── Main poll loop ────────────────────────────────────────────
poll:
    LOAD r12, r1         ; r12 = key from port
    CMP r12, r15          ; r11 = 0 if key == 0
    JZ r11, poll          ; no key -> go back to poll

    ; Key pressed -- save key to RAM, then clear port
    STORE r17, r12        ; save key at RAM[0x0300]
    LDI r12, 0
    STORE r1, r12        ; clear keyboard port

    ; Reload saved key
    LOAD r12, r17

; ── Dispatch on key value ────────────────────────────────────

    ; Check for W (87 = up)
    LDI r2, 87
    CMP r12, r2
    JNZ r11, check_s
    SUB r13, r16         ; Y -= 4
    ; Clamp Y >= 0 (if Y underflowed to large value, fix it)
    LDI r2, 252
    CMP r13, r2
    JNZ r11, move_done
    LDI r13, 0
    JMP move_done

check_s:
    ; Check for S (83 = down)
    LDI r2, 83
    CMP r12, r2
    JNZ r11, check_a
    ADD r13, r16         ; Y += 4
    ; Clamp Y <= 252
    LDI r2, 253
    CMP r13, r2
    JNZ r11, move_done
    LDI r13, 252
    JMP move_done

check_a:
    ; Check for A (65 = left)
    LDI r2, 65
    CMP r12, r2
    JNZ r11, check_d
    SUB r7, r16         ; X -= 4
    ; Clamp X >= 0
    LDI r2, 252
    CMP r7, r2
    JNZ r11, move_done
    LDI r7, 0
    JMP move_done

check_d:
    ; Check for D (68 = right)
    LDI r2, 68
    CMP r12, r2
    JNZ r11, check_space
    ADD r7, r16         ; X += 4
    ; Clamp X <= 252
    LDI r2, 253
    CMP r7, r2
    JNZ r11, move_done
    LDI r7, 252
    JMP move_done

check_space:
    ; Check for Space (32 = paint)
    LDI r2, 32
    CMP r12, r2
    JNZ r11, check_q

    ; Compute paint color
    ; Use paint_counter * 50000 + 0xFF
    ; This cycles through colors as counter grows
    LDI r2, 50000
    MUL r2, r6           ; r2 = paint_counter * 50000
    LDI r5, 0xFF
    OR r2, r5            ; ensure some blue channel

    PSET r7, r13, r2    ; paint pixel

    ; Increment paint counter
    ADD r6, r9
    ADD r3, r9

    ; Check if done
    CMP r6, r18
    JNZ r11, paint_done
    HALT                 ; reached max paints

paint_done:
    JMP poll

check_q:
    ; Check for Q (81 = quit)
    LDI r2, 81
    CMP r12, r2
    JNZ r11, unknown_key
    HALT                 ; quit on Q

unknown_key:
    JMP poll             ; ignore unknown keys

move_done:
    PSET r7, r13, r4   ; draw cursor at new position
    JMP poll
