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
;   r2 = cursor X (starts at 128)
;   r13 = cursor Y (starts at 128)
;   r0 = key port address (0xFFFF)
;   r12 = color register
;   r7 = zero constant (0)
;   r5 = one constant (1)
;   r16 = four constant (4)
;   r17 = saved key address (0x0300)
;   r18 = max paints (5)
;   r9  = paint counter
;   r10  = temp
;   r6  = temp
;   r1  = temp
;   r3  = color cycling offset

; ── Constants ──────────────────────────────────────────────────
    LDI r2, 128         ; cursor X
    LDI r13, 128         ; cursor Y
    LDI r0, 0xFFFF      ; key port address
    LDI r12, 0x00FFFF    ; cursor color (cyan)
    LDI r7, 0           ; zero
    LDI r5, 1           ; one
    LDI r16, 4           ; step size
    LDI r17, 0x0300      ; saved key RAM address
    LDI r18, 5           ; max paints before halt
    LDI r9, 0            ; paint counter
    LDI r3, 0            ; color cycling offset

; ── Store PAINTER signature at RAM[0x0200..0x0207] ─────────
    LDI r10, 0x0200
    LDI r6, 80           ; P
    STORE r10, r6
    ADD r10, r5
    LDI r6, 65           ; A
    STORE r10, r6
    ADD r10, r5
    LDI r6, 73           ; I
    STORE r10, r6
    ADD r10, r5
    LDI r6, 78           ; N
    STORE r10, r6
    ADD r10, r5
    LDI r6, 84           ; T
    STORE r10, r6
    ADD r10, r5
    LDI r6, 69           ; E
    STORE r10, r6
    ADD r10, r5
    LDI r6, 82           ; R
    STORE r10, r6

; ── Draw initial cursor pixel ────────────────────────────────
    PSET r2, r13, r12

; ── Main poll loop ────────────────────────────────────────────
poll:
    LOAD r10, r0         ; r10 = key from port
    CMP r10, r7          ; r8 = 0 if key == 0
    JZ r8, poll          ; no key -> go back to poll

    ; Key pressed -- save key to RAM, then clear port
    STORE r17, r10        ; save key at RAM[0x0300]
    LDI r10, 0
    STORE r0, r10        ; clear keyboard port

    ; Reload saved key
    LOAD r10, r17

; ── Dispatch on key value ────────────────────────────────────

    ; Check for W (87 = up)
    LDI r6, 87
    CMP r10, r6
    JNZ r8, check_s
    SUB r13, r16         ; Y -= 4
    ; Clamp Y >= 0 (if Y underflowed to large value, fix it)
    LDI r6, 252
    CMP r13, r6
    JNZ r8, move_done
    LDI r13, 0
    JMP move_done

check_s:
    ; Check for S (83 = down)
    LDI r6, 83
    CMP r10, r6
    JNZ r8, check_a
    ADD r13, r16         ; Y += 4
    ; Clamp Y <= 252
    LDI r6, 253
    CMP r13, r6
    JNZ r8, move_done
    LDI r13, 252
    JMP move_done

check_a:
    ; Check for A (65 = left)
    LDI r6, 65
    CMP r10, r6
    JNZ r8, check_d
    SUB r2, r16         ; X -= 4
    ; Clamp X >= 0
    LDI r6, 252
    CMP r2, r6
    JNZ r8, move_done
    LDI r2, 0
    JMP move_done

check_d:
    ; Check for D (68 = right)
    LDI r6, 68
    CMP r10, r6
    JNZ r8, check_space
    ADD r2, r16         ; X += 4
    ; Clamp X <= 252
    LDI r6, 253
    CMP r2, r6
    JNZ r8, move_done
    LDI r2, 252
    JMP move_done

check_space:
    ; Check for Space (32 = paint)
    LDI r6, 32
    CMP r10, r6
    JNZ r8, check_q

    ; Compute paint color
    ; Use paint_counter * 50000 + 0xFF
    ; This cycles through colors as counter grows
    LDI r6, 50000
    MUL r6, r9           ; r6 = paint_counter * 50000
    LDI r1, 0xFF
    OR r6, r1            ; ensure some blue channel

    PSET r2, r13, r6    ; paint pixel

    ; Increment paint counter
    ADD r9, r5
    ADD r3, r5

    ; Check if done
    CMP r9, r18
    JNZ r8, paint_done
    HALT                 ; reached max paints

paint_done:
    JMP poll

check_q:
    ; Check for Q (81 = quit)
    LDI r6, 81
    CMP r10, r6
    JNZ r8, unknown_key
    HALT                 ; quit on Q

unknown_key:
    JMP poll             ; ignore unknown keys

move_done:
    PSET r2, r13, r12   ; draw cursor at new position
    JMP poll
