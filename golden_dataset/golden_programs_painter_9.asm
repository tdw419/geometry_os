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
;   r13 = cursor X (starts at 128)
;   r8 = cursor Y (starts at 128)
;   r2 = key port address (0xFFFF)
;   r9 = color register
;   r12 = zero constant (0)
;   r10 = one constant (1)
;   r16 = four constant (4)
;   r17 = saved key address (0x0300)
;   r18 = max paints (5)
;   r5  = paint counter
;   r1  = temp
;   r6  = temp
;   r3  = temp
;   r0  = color cycling offset

; ── Constants ──────────────────────────────────────────────────
    LDI r13, 128         ; cursor X
    LDI r8, 128         ; cursor Y
    LDI r2, 0xFFFF      ; key port address
    LDI r9, 0x00FFFF    ; cursor color (cyan)
    LDI r12, 0           ; zero
    LDI r10, 1           ; one
    LDI r16, 4           ; step size
    LDI r17, 0x0300      ; saved key RAM address
    LDI r18, 5           ; max paints before halt
    LDI r5, 0            ; paint counter
    LDI r0, 0            ; color cycling offset

; ── Store PAINTER signature at RAM[0x0200..0x0207] ─────────
    LDI r1, 0x0200
    LDI r6, 80           ; P
    STORE r1, r6
    ADD r1, r10
    LDI r6, 65           ; A
    STORE r1, r6
    ADD r1, r10
    LDI r6, 73           ; I
    STORE r1, r6
    ADD r1, r10
    LDI r6, 78           ; N
    STORE r1, r6
    ADD r1, r10
    LDI r6, 84           ; T
    STORE r1, r6
    ADD r1, r10
    LDI r6, 69           ; E
    STORE r1, r6
    ADD r1, r10
    LDI r6, 82           ; R
    STORE r1, r6

; ── Draw initial cursor pixel ────────────────────────────────
    PSET r13, r8, r9

; ── Main poll loop ────────────────────────────────────────────
poll:
    LOAD r1, r2         ; r1 = key from port
    CMP r1, r12          ; r15 = 0 if key == 0
    JZ r15, poll          ; no key -> go back to poll

    ; Key pressed -- save key to RAM, then clear port
    STORE r17, r1        ; save key at RAM[0x0300]
    LDI r1, 0
    STORE r2, r1        ; clear keyboard port

    ; Reload saved key
    LOAD r1, r17

; ── Dispatch on key value ────────────────────────────────────

    ; Check for W (87 = up)
    LDI r6, 87
    CMP r1, r6
    JNZ r15, check_s
    SUB r8, r16         ; Y -= 4
    ; Clamp Y >= 0 (if Y underflowed to large value, fix it)
    LDI r6, 252
    CMP r8, r6
    JNZ r15, move_done
    LDI r8, 0
    JMP move_done

check_s:
    ; Check for S (83 = down)
    LDI r6, 83
    CMP r1, r6
    JNZ r15, check_a
    ADD r8, r16         ; Y += 4
    ; Clamp Y <= 252
    LDI r6, 253
    CMP r8, r6
    JNZ r15, move_done
    LDI r8, 252
    JMP move_done

check_a:
    ; Check for A (65 = left)
    LDI r6, 65
    CMP r1, r6
    JNZ r15, check_d
    SUB r13, r16         ; X -= 4
    ; Clamp X >= 0
    LDI r6, 252
    CMP r13, r6
    JNZ r15, move_done
    LDI r13, 0
    JMP move_done

check_d:
    ; Check for D (68 = right)
    LDI r6, 68
    CMP r1, r6
    JNZ r15, check_space
    ADD r13, r16         ; X += 4
    ; Clamp X <= 252
    LDI r6, 253
    CMP r13, r6
    JNZ r15, move_done
    LDI r13, 252
    JMP move_done

check_space:
    ; Check for Space (32 = paint)
    LDI r6, 32
    CMP r1, r6
    JNZ r15, check_q

    ; Compute paint color
    ; Use paint_counter * 50000 + 0xFF
    ; This cycles through colors as counter grows
    LDI r6, 50000
    MUL r6, r5           ; r6 = paint_counter * 50000
    LDI r3, 0xFF
    OR r6, r3            ; ensure some blue channel

    PSET r13, r8, r6    ; paint pixel

    ; Increment paint counter
    ADD r5, r10
    ADD r0, r10

    ; Check if done
    CMP r5, r18
    JNZ r15, paint_done
    HALT                 ; reached max paints

paint_done:
    JMP poll

check_q:
    ; Check for Q (81 = quit)
    LDI r6, 81
    CMP r1, r6
    JNZ r15, unknown_key
    HALT                 ; quit on Q

unknown_key:
    JMP poll             ; ignore unknown keys

move_done:
    PSET r13, r8, r9   ; draw cursor at new position
    JMP poll
