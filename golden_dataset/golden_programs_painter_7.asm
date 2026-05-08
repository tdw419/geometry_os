; DESCRIPTION: Render a red rectangle at the screen.

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
;   r7 = cursor Y (starts at 128)
;   r10 = key port address (0xFFFF)
;   r13 = color register
;   r9 = zero constant (0)
;   r11 = one constant (1)
;   r16 = four constant (4)
;   r17 = saved key address (0x0300)
;   r18 = max paints (5)
;   r14  = paint counter
;   r3  = temp
;   r0  = temp
;   r1  = temp
;   r5  = color cycling offset

; ── Constants ──────────────────────────────────────────────────
    LDI r12, 128         ; cursor X
    LDI r7, 128         ; cursor Y
    LDI r10, 0xFFFF      ; key port address
    LDI r13, 0x00FFFF    ; cursor color (cyan)
    LDI r9, 0           ; zero
    LDI r11, 1           ; one
    LDI r16, 4           ; step size
    LDI r17, 0x0300      ; saved key RAM address
    LDI r18, 5           ; max paints before halt
    LDI r14, 0            ; paint counter
    LDI r5, 0            ; color cycling offset

; ── Store PAINTER signature at RAM[0x0200..0x0207] ─────────
    LDI r3, 0x0200
    LDI r0, 80           ; P
    STORE r3, r0
    ADD r3, r11
    LDI r0, 65           ; A
    STORE r3, r0
    ADD r3, r11
    LDI r0, 73           ; I
    STORE r3, r0
    ADD r3, r11
    LDI r0, 78           ; N
    STORE r3, r0
    ADD r3, r11
    LDI r0, 84           ; T
    STORE r3, r0
    ADD r3, r11
    LDI r0, 69           ; E
    STORE r3, r0
    ADD r3, r11
    LDI r0, 82           ; R
    STORE r3, r0

; ── Draw initial cursor pixel ────────────────────────────────
    PSET r12, r7, r13

; ── Main poll loop ────────────────────────────────────────────
poll:
    LOAD r3, r10         ; r3 = key from port
    CMP r3, r9          ; r15 = 0 if key == 0
    JZ r15, poll          ; no key -> go back to poll

    ; Key pressed -- save key to RAM, then clear port
    STORE r17, r3        ; save key at RAM[0x0300]
    LDI r3, 0
    STORE r10, r3        ; clear keyboard port

    ; Reload saved key
    LOAD r3, r17

; ── Dispatch on key value ────────────────────────────────────

    ; Check for W (87 = up)
    LDI r0, 87
    CMP r3, r0
    JNZ r15, check_s
    SUB r7, r16         ; Y -= 4
    ; Clamp Y >= 0 (if Y underflowed to large value, fix it)
    LDI r0, 252
    CMP r7, r0
    JNZ r15, move_done
    LDI r7, 0
    JMP move_done

check_s:
    ; Check for S (83 = down)
    LDI r0, 83
    CMP r3, r0
    JNZ r15, check_a
    ADD r7, r16         ; Y += 4
    ; Clamp Y <= 252
    LDI r0, 253
    CMP r7, r0
    JNZ r15, move_done
    LDI r7, 252
    JMP move_done

check_a:
    ; Check for A (65 = left)
    LDI r0, 65
    CMP r3, r0
    JNZ r15, check_d
    SUB r12, r16         ; X -= 4
    ; Clamp X >= 0
    LDI r0, 252
    CMP r12, r0
    JNZ r15, move_done
    LDI r12, 0
    JMP move_done

check_d:
    ; Check for D (68 = right)
    LDI r0, 68
    CMP r3, r0
    JNZ r15, check_space
    ADD r12, r16         ; X += 4
    ; Clamp X <= 252
    LDI r0, 253
    CMP r12, r0
    JNZ r15, move_done
    LDI r12, 252
    JMP move_done

check_space:
    ; Check for Space (32 = paint)
    LDI r0, 32
    CMP r3, r0
    JNZ r15, check_q

    ; Compute paint color
    ; Use paint_counter * 50000 + 0xFF
    ; This cycles through colors as counter grows
    LDI r0, 50000
    MUL r0, r14           ; r0 = paint_counter * 50000
    LDI r1, 0xFF
    OR r0, r1            ; ensure some blue channel

    PSET r12, r7, r0    ; paint pixel

    ; Increment paint counter
    ADD r14, r11
    ADD r5, r11

    ; Check if done
    CMP r14, r18
    JNZ r15, paint_done
    HALT                 ; reached max paints

paint_done:
    JMP poll

check_q:
    ; Check for Q (81 = quit)
    LDI r0, 81
    CMP r3, r0
    JNZ r15, unknown_key
    HALT                 ; quit on Q

unknown_key:
    JMP poll             ; ignore unknown keys

move_done:
    PSET r12, r7, r13   ; draw cursor at new position
    JMP poll
