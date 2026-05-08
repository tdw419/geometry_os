; DESCRIPTION: A red rectangle centered at the screen with fixed size.

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
;   r5 = cursor X (starts at 128)
;   r15 = cursor Y (starts at 128)
;   r10 = key port address (0xFFFF)
;   r3 = color register
;   r8 = zero constant (0)
;   r11 = one constant (1)
;   r16 = four constant (4)
;   r17 = saved key address (0x0300)
;   r18 = max paints (5)
;   r12  = paint counter
;   r9  = temp
;   r13  = temp
;   r1  = temp
;   r14  = color cycling offset

; ── Constants ──────────────────────────────────────────────────
    LDI r5, 128         ; cursor X
    LDI r15, 128         ; cursor Y
    LDI r10, 0xFFFF      ; key port address
    LDI r3, 0x00FFFF    ; cursor color (cyan)
    LDI r8, 0           ; zero
    LDI r11, 1           ; one
    LDI r16, 4           ; step size
    LDI r17, 0x0300      ; saved key RAM address
    LDI r18, 5           ; max paints before halt
    LDI r12, 0            ; paint counter
    LDI r14, 0            ; color cycling offset

; ── Store PAINTER signature at RAM[0x0200..0x0207] ─────────
    LDI r9, 0x0200
    LDI r13, 80           ; P
    STORE r9, r13
    ADD r9, r11
    LDI r13, 65           ; A
    STORE r9, r13
    ADD r9, r11
    LDI r13, 73           ; I
    STORE r9, r13
    ADD r9, r11
    LDI r13, 78           ; N
    STORE r9, r13
    ADD r9, r11
    LDI r13, 84           ; T
    STORE r9, r13
    ADD r9, r11
    LDI r13, 69           ; E
    STORE r9, r13
    ADD r9, r11
    LDI r13, 82           ; R
    STORE r9, r13

; ── Draw initial cursor pixel ────────────────────────────────
    PSET r5, r15, r3

; ── Main poll loop ────────────────────────────────────────────
poll:
    LOAD r9, r10         ; r9 = key from port
    CMP r9, r8          ; r2 = 0 if key == 0
    JZ r2, poll          ; no key -> go back to poll

    ; Key pressed -- save key to RAM, then clear port
    STORE r17, r9        ; save key at RAM[0x0300]
    LDI r9, 0
    STORE r10, r9        ; clear keyboard port

    ; Reload saved key
    LOAD r9, r17

; ── Dispatch on key value ────────────────────────────────────

    ; Check for W (87 = up)
    LDI r13, 87
    CMP r9, r13
    JNZ r2, check_s
    SUB r15, r16         ; Y -= 4
    ; Clamp Y >= 0 (if Y underflowed to large value, fix it)
    LDI r13, 252
    CMP r15, r13
    JNZ r2, move_done
    LDI r15, 0
    JMP move_done

check_s:
    ; Check for S (83 = down)
    LDI r13, 83
    CMP r9, r13
    JNZ r2, check_a
    ADD r15, r16         ; Y += 4
    ; Clamp Y <= 252
    LDI r13, 253
    CMP r15, r13
    JNZ r2, move_done
    LDI r15, 252
    JMP move_done

check_a:
    ; Check for A (65 = left)
    LDI r13, 65
    CMP r9, r13
    JNZ r2, check_d
    SUB r5, r16         ; X -= 4
    ; Clamp X >= 0
    LDI r13, 252
    CMP r5, r13
    JNZ r2, move_done
    LDI r5, 0
    JMP move_done

check_d:
    ; Check for D (68 = right)
    LDI r13, 68
    CMP r9, r13
    JNZ r2, check_space
    ADD r5, r16         ; X += 4
    ; Clamp X <= 252
    LDI r13, 253
    CMP r5, r13
    JNZ r2, move_done
    LDI r5, 252
    JMP move_done

check_space:
    ; Check for Space (32 = paint)
    LDI r13, 32
    CMP r9, r13
    JNZ r2, check_q

    ; Compute paint color
    ; Use paint_counter * 50000 + 0xFF
    ; This cycles through colors as counter grows
    LDI r13, 50000
    MUL r13, r12           ; r13 = paint_counter * 50000
    LDI r1, 0xFF
    OR r13, r1            ; ensure some blue channel

    PSET r5, r15, r13    ; paint pixel

    ; Increment paint counter
    ADD r12, r11
    ADD r14, r11

    ; Check if done
    CMP r12, r18
    JNZ r2, paint_done
    HALT                 ; reached max paints

paint_done:
    JMP poll

check_q:
    ; Check for Q (81 = quit)
    LDI r13, 81
    CMP r9, r13
    JNZ r2, unknown_key
    HALT                 ; quit on Q

unknown_key:
    JMP poll             ; ignore unknown keys

move_done:
    PSET r5, r15, r3   ; draw cursor at new position
    JMP poll
