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
;   r15 = cursor X (starts at 128)
;   r0 = cursor Y (starts at 128)
;   r4 = key port address (0xFFFF)
;   r1 = color register
;   r9 = zero constant (0)
;   r11 = one constant (1)
;   r16 = four constant (4)
;   r17 = saved key address (0x0300)
;   r18 = max paints (5)
;   r6  = paint counter
;   r3  = temp
;   r8  = temp
;   r13  = temp
;   r7  = color cycling offset

; ── Constants ──────────────────────────────────────────────────
    LDI r15, 128         ; cursor X
    LDI r0, 128         ; cursor Y
    LDI r4, 0xFFFF      ; key port address
    LDI r1, 0x00FFFF    ; cursor color (cyan)
    LDI r9, 0           ; zero
    LDI r11, 1           ; one
    LDI r16, 4           ; step size
    LDI r17, 0x0300      ; saved key RAM address
    LDI r18, 5           ; max paints before halt
    LDI r6, 0            ; paint counter
    LDI r7, 0            ; color cycling offset

; ── Store PAINTER signature at RAM[0x0200..0x0207] ─────────
    LDI r3, 0x0200
    LDI r8, 80           ; P
    STORE r3, r8
    ADD r3, r11
    LDI r8, 65           ; A
    STORE r3, r8
    ADD r3, r11
    LDI r8, 73           ; I
    STORE r3, r8
    ADD r3, r11
    LDI r8, 78           ; N
    STORE r3, r8
    ADD r3, r11
    LDI r8, 84           ; T
    STORE r3, r8
    ADD r3, r11
    LDI r8, 69           ; E
    STORE r3, r8
    ADD r3, r11
    LDI r8, 82           ; R
    STORE r3, r8

; ── Draw initial cursor pixel ────────────────────────────────
    PSET r15, r0, r1

; ── Main poll loop ────────────────────────────────────────────
poll:
    LOAD r3, r4         ; r3 = key from port
    CMP r3, r9          ; r5 = 0 if key == 0
    JZ r5, poll          ; no key -> go back to poll

    ; Key pressed -- save key to RAM, then clear port
    STORE r17, r3        ; save key at RAM[0x0300]
    LDI r3, 0
    STORE r4, r3        ; clear keyboard port

    ; Reload saved key
    LOAD r3, r17

; ── Dispatch on key value ────────────────────────────────────

    ; Check for W (87 = up)
    LDI r8, 87
    CMP r3, r8
    JNZ r5, check_s
    SUB r0, r16         ; Y -= 4
    ; Clamp Y >= 0 (if Y underflowed to large value, fix it)
    LDI r8, 252
    CMP r0, r8
    JNZ r5, move_done
    LDI r0, 0
    JMP move_done

check_s:
    ; Check for S (83 = down)
    LDI r8, 83
    CMP r3, r8
    JNZ r5, check_a
    ADD r0, r16         ; Y += 4
    ; Clamp Y <= 252
    LDI r8, 253
    CMP r0, r8
    JNZ r5, move_done
    LDI r0, 252
    JMP move_done

check_a:
    ; Check for A (65 = left)
    LDI r8, 65
    CMP r3, r8
    JNZ r5, check_d
    SUB r15, r16         ; X -= 4
    ; Clamp X >= 0
    LDI r8, 252
    CMP r15, r8
    JNZ r5, move_done
    LDI r15, 0
    JMP move_done

check_d:
    ; Check for D (68 = right)
    LDI r8, 68
    CMP r3, r8
    JNZ r5, check_space
    ADD r15, r16         ; X += 4
    ; Clamp X <= 252
    LDI r8, 253
    CMP r15, r8
    JNZ r5, move_done
    LDI r15, 252
    JMP move_done

check_space:
    ; Check for Space (32 = paint)
    LDI r8, 32
    CMP r3, r8
    JNZ r5, check_q

    ; Compute paint color
    ; Use paint_counter * 50000 + 0xFF
    ; This cycles through colors as counter grows
    LDI r8, 50000
    MUL r8, r6           ; r8 = paint_counter * 50000
    LDI r13, 0xFF
    OR r8, r13            ; ensure some blue channel

    PSET r15, r0, r8    ; paint pixel

    ; Increment paint counter
    ADD r6, r11
    ADD r7, r11

    ; Check if done
    CMP r6, r18
    JNZ r5, paint_done
    HALT                 ; reached max paints

paint_done:
    JMP poll

check_q:
    ; Check for Q (81 = quit)
    LDI r8, 81
    CMP r3, r8
    JNZ r5, unknown_key
    HALT                 ; quit on Q

unknown_key:
    JMP poll             ; ignore unknown keys

move_done:
    PSET r15, r0, r1   ; draw cursor at new position
    JMP poll
