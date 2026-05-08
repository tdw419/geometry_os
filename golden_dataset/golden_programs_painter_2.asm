; DESCRIPTION: Draws a red rectangle at the screen with fixed size.

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
;   r11 = cursor X (starts at 128)
;   r13 = cursor Y (starts at 128)
;   r3 = key port address (0xFFFF)
;   r0 = color register
;   r4 = zero constant (0)
;   r9 = one constant (1)
;   r16 = four constant (4)
;   r17 = saved key address (0x0300)
;   r18 = max paints (5)
;   r14  = paint counter
;   r5  = temp
;   r7  = temp
;   r1  = temp
;   r8  = color cycling offset

; ── Constants ──────────────────────────────────────────────────
    LDI r11, 128         ; cursor X
    LDI r13, 128         ; cursor Y
    LDI r3, 0xFFFF      ; key port address
    LDI r0, 0x00FFFF    ; cursor color (cyan)
    LDI r4, 0           ; zero
    LDI r9, 1           ; one
    LDI r16, 4           ; step size
    LDI r17, 0x0300      ; saved key RAM address
    LDI r18, 5           ; max paints before halt
    LDI r14, 0            ; paint counter
    LDI r8, 0            ; color cycling offset

; ── Store PAINTER signature at RAM[0x0200..0x0207] ─────────
    LDI r5, 0x0200
    LDI r7, 80           ; P
    STORE r5, r7
    ADD r5, r9
    LDI r7, 65           ; A
    STORE r5, r7
    ADD r5, r9
    LDI r7, 73           ; I
    STORE r5, r7
    ADD r5, r9
    LDI r7, 78           ; N
    STORE r5, r7
    ADD r5, r9
    LDI r7, 84           ; T
    STORE r5, r7
    ADD r5, r9
    LDI r7, 69           ; E
    STORE r5, r7
    ADD r5, r9
    LDI r7, 82           ; R
    STORE r5, r7

; ── Draw initial cursor pixel ────────────────────────────────
    PSET r11, r13, r0

; ── Main poll loop ────────────────────────────────────────────
poll:
    LOAD r5, r3         ; r5 = key from port
    CMP r5, r4          ; r15 = 0 if key == 0
    JZ r15, poll          ; no key -> go back to poll

    ; Key pressed -- save key to RAM, then clear port
    STORE r17, r5        ; save key at RAM[0x0300]
    LDI r5, 0
    STORE r3, r5        ; clear keyboard port

    ; Reload saved key
    LOAD r5, r17

; ── Dispatch on key value ────────────────────────────────────

    ; Check for W (87 = up)
    LDI r7, 87
    CMP r5, r7
    JNZ r15, check_s
    SUB r13, r16         ; Y -= 4
    ; Clamp Y >= 0 (if Y underflowed to large value, fix it)
    LDI r7, 252
    CMP r13, r7
    JNZ r15, move_done
    LDI r13, 0
    JMP move_done

check_s:
    ; Check for S (83 = down)
    LDI r7, 83
    CMP r5, r7
    JNZ r15, check_a
    ADD r13, r16         ; Y += 4
    ; Clamp Y <= 252
    LDI r7, 253
    CMP r13, r7
    JNZ r15, move_done
    LDI r13, 252
    JMP move_done

check_a:
    ; Check for A (65 = left)
    LDI r7, 65
    CMP r5, r7
    JNZ r15, check_d
    SUB r11, r16         ; X -= 4
    ; Clamp X >= 0
    LDI r7, 252
    CMP r11, r7
    JNZ r15, move_done
    LDI r11, 0
    JMP move_done

check_d:
    ; Check for D (68 = right)
    LDI r7, 68
    CMP r5, r7
    JNZ r15, check_space
    ADD r11, r16         ; X += 4
    ; Clamp X <= 252
    LDI r7, 253
    CMP r11, r7
    JNZ r15, move_done
    LDI r11, 252
    JMP move_done

check_space:
    ; Check for Space (32 = paint)
    LDI r7, 32
    CMP r5, r7
    JNZ r15, check_q

    ; Compute paint color
    ; Use paint_counter * 50000 + 0xFF
    ; This cycles through colors as counter grows
    LDI r7, 50000
    MUL r7, r14           ; r7 = paint_counter * 50000
    LDI r1, 0xFF
    OR r7, r1            ; ensure some blue channel

    PSET r11, r13, r7    ; paint pixel

    ; Increment paint counter
    ADD r14, r9
    ADD r8, r9

    ; Check if done
    CMP r14, r18
    JNZ r15, paint_done
    HALT                 ; reached max paints

paint_done:
    JMP poll

check_q:
    ; Check for Q (81 = quit)
    LDI r7, 81
    CMP r5, r7
    JNZ r15, unknown_key
    HALT                 ; quit on Q

unknown_key:
    JMP poll             ; ignore unknown keys

move_done:
    PSET r11, r13, r0   ; draw cursor at new position
    JMP poll
