; DESCRIPTION: Geometry OS program to draw a red rectangle.

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
;   r4 = cursor Y (starts at 128)
;   r0 = key port address (0xFFFF)
;   r9 = color register
;   r11 = zero constant (0)
;   r2 = one constant (1)
;   r16 = four constant (4)
;   r17 = saved key address (0x0300)
;   r18 = max paints (5)
;   r6  = paint counter
;   r1  = temp
;   r5  = temp
;   r10  = temp
;   r7  = color cycling offset

; ── Constants ──────────────────────────────────────────────────
    LDI r12, 128         ; cursor X
    LDI r4, 128         ; cursor Y
    LDI r0, 0xFFFF      ; key port address
    LDI r9, 0x00FFFF    ; cursor color (cyan)
    LDI r11, 0           ; zero
    LDI r2, 1           ; one
    LDI r16, 4           ; step size
    LDI r17, 0x0300      ; saved key RAM address
    LDI r18, 5           ; max paints before halt
    LDI r6, 0            ; paint counter
    LDI r7, 0            ; color cycling offset

; ── Store PAINTER signature at RAM[0x0200..0x0207] ─────────
    LDI r1, 0x0200
    LDI r5, 80           ; P
    STORE r1, r5
    ADD r1, r2
    LDI r5, 65           ; A
    STORE r1, r5
    ADD r1, r2
    LDI r5, 73           ; I
    STORE r1, r5
    ADD r1, r2
    LDI r5, 78           ; N
    STORE r1, r5
    ADD r1, r2
    LDI r5, 84           ; T
    STORE r1, r5
    ADD r1, r2
    LDI r5, 69           ; E
    STORE r1, r5
    ADD r1, r2
    LDI r5, 82           ; R
    STORE r1, r5

; ── Draw initial cursor pixel ────────────────────────────────
    PSET r12, r4, r9

; ── Main poll loop ────────────────────────────────────────────
poll:
    LOAD r1, r0         ; r1 = key from port
    CMP r1, r11          ; r13 = 0 if key == 0
    JZ r13, poll          ; no key -> go back to poll

    ; Key pressed -- save key to RAM, then clear port
    STORE r17, r1        ; save key at RAM[0x0300]
    LDI r1, 0
    STORE r0, r1        ; clear keyboard port

    ; Reload saved key
    LOAD r1, r17

; ── Dispatch on key value ────────────────────────────────────

    ; Check for W (87 = up)
    LDI r5, 87
    CMP r1, r5
    JNZ r13, check_s
    SUB r4, r16         ; Y -= 4
    ; Clamp Y >= 0 (if Y underflowed to large value, fix it)
    LDI r5, 252
    CMP r4, r5
    JNZ r13, move_done
    LDI r4, 0
    JMP move_done

check_s:
    ; Check for S (83 = down)
    LDI r5, 83
    CMP r1, r5
    JNZ r13, check_a
    ADD r4, r16         ; Y += 4
    ; Clamp Y <= 252
    LDI r5, 253
    CMP r4, r5
    JNZ r13, move_done
    LDI r4, 252
    JMP move_done

check_a:
    ; Check for A (65 = left)
    LDI r5, 65
    CMP r1, r5
    JNZ r13, check_d
    SUB r12, r16         ; X -= 4
    ; Clamp X >= 0
    LDI r5, 252
    CMP r12, r5
    JNZ r13, move_done
    LDI r12, 0
    JMP move_done

check_d:
    ; Check for D (68 = right)
    LDI r5, 68
    CMP r1, r5
    JNZ r13, check_space
    ADD r12, r16         ; X += 4
    ; Clamp X <= 252
    LDI r5, 253
    CMP r12, r5
    JNZ r13, move_done
    LDI r12, 252
    JMP move_done

check_space:
    ; Check for Space (32 = paint)
    LDI r5, 32
    CMP r1, r5
    JNZ r13, check_q

    ; Compute paint color
    ; Use paint_counter * 50000 + 0xFF
    ; This cycles through colors as counter grows
    LDI r5, 50000
    MUL r5, r6           ; r5 = paint_counter * 50000
    LDI r10, 0xFF
    OR r5, r10            ; ensure some blue channel

    PSET r12, r4, r5    ; paint pixel

    ; Increment paint counter
    ADD r6, r2
    ADD r7, r2

    ; Check if done
    CMP r6, r18
    JNZ r13, paint_done
    HALT                 ; reached max paints

paint_done:
    JMP poll

check_q:
    ; Check for Q (81 = quit)
    LDI r5, 81
    CMP r1, r5
    JNZ r13, unknown_key
    HALT                 ; quit on Q

unknown_key:
    JMP poll             ; ignore unknown keys

move_done:
    PSET r12, r4, r9   ; draw cursor at new position
    JMP poll
