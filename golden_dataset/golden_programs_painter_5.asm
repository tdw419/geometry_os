; DESCRIPTION: Draw rectangle: pos=the screen, color=red, size=fixed size.

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
;   r1 = cursor X (starts at 128)
;   r8 = cursor Y (starts at 128)
;   r15 = key port address (0xFFFF)
;   r7 = color register
;   r10 = zero constant (0)
;   r14 = one constant (1)
;   r16 = four constant (4)
;   r17 = saved key address (0x0300)
;   r18 = max paints (5)
;   r5  = paint counter
;   r13  = temp
;   r2  = temp
;   r0  = temp
;   r11  = color cycling offset

; ── Constants ──────────────────────────────────────────────────
    LDI r1, 128         ; cursor X
    LDI r8, 128         ; cursor Y
    LDI r15, 0xFFFF      ; key port address
    LDI r7, 0x00FFFF    ; cursor color (cyan)
    LDI r10, 0           ; zero
    LDI r14, 1           ; one
    LDI r16, 4           ; step size
    LDI r17, 0x0300      ; saved key RAM address
    LDI r18, 5           ; max paints before halt
    LDI r5, 0            ; paint counter
    LDI r11, 0            ; color cycling offset

; ── Store PAINTER signature at RAM[0x0200..0x0207] ─────────
    LDI r13, 0x0200
    LDI r2, 80           ; P
    STORE r13, r2
    ADD r13, r14
    LDI r2, 65           ; A
    STORE r13, r2
    ADD r13, r14
    LDI r2, 73           ; I
    STORE r13, r2
    ADD r13, r14
    LDI r2, 78           ; N
    STORE r13, r2
    ADD r13, r14
    LDI r2, 84           ; T
    STORE r13, r2
    ADD r13, r14
    LDI r2, 69           ; E
    STORE r13, r2
    ADD r13, r14
    LDI r2, 82           ; R
    STORE r13, r2

; ── Draw initial cursor pixel ────────────────────────────────
    PSET r1, r8, r7

; ── Main poll loop ────────────────────────────────────────────
poll:
    LOAD r13, r15         ; r13 = key from port
    CMP r13, r10          ; r12 = 0 if key == 0
    JZ r12, poll          ; no key -> go back to poll

    ; Key pressed -- save key to RAM, then clear port
    STORE r17, r13        ; save key at RAM[0x0300]
    LDI r13, 0
    STORE r15, r13        ; clear keyboard port

    ; Reload saved key
    LOAD r13, r17

; ── Dispatch on key value ────────────────────────────────────

    ; Check for W (87 = up)
    LDI r2, 87
    CMP r13, r2
    JNZ r12, check_s
    SUB r8, r16         ; Y -= 4
    ; Clamp Y >= 0 (if Y underflowed to large value, fix it)
    LDI r2, 252
    CMP r8, r2
    JNZ r12, move_done
    LDI r8, 0
    JMP move_done

check_s:
    ; Check for S (83 = down)
    LDI r2, 83
    CMP r13, r2
    JNZ r12, check_a
    ADD r8, r16         ; Y += 4
    ; Clamp Y <= 252
    LDI r2, 253
    CMP r8, r2
    JNZ r12, move_done
    LDI r8, 252
    JMP move_done

check_a:
    ; Check for A (65 = left)
    LDI r2, 65
    CMP r13, r2
    JNZ r12, check_d
    SUB r1, r16         ; X -= 4
    ; Clamp X >= 0
    LDI r2, 252
    CMP r1, r2
    JNZ r12, move_done
    LDI r1, 0
    JMP move_done

check_d:
    ; Check for D (68 = right)
    LDI r2, 68
    CMP r13, r2
    JNZ r12, check_space
    ADD r1, r16         ; X += 4
    ; Clamp X <= 252
    LDI r2, 253
    CMP r1, r2
    JNZ r12, move_done
    LDI r1, 252
    JMP move_done

check_space:
    ; Check for Space (32 = paint)
    LDI r2, 32
    CMP r13, r2
    JNZ r12, check_q

    ; Compute paint color
    ; Use paint_counter * 50000 + 0xFF
    ; This cycles through colors as counter grows
    LDI r2, 50000
    MUL r2, r5           ; r2 = paint_counter * 50000
    LDI r0, 0xFF
    OR r2, r0            ; ensure some blue channel

    PSET r1, r8, r2    ; paint pixel

    ; Increment paint counter
    ADD r5, r14
    ADD r11, r14

    ; Check if done
    CMP r5, r18
    JNZ r12, paint_done
    HALT                 ; reached max paints

paint_done:
    JMP poll

check_q:
    ; Check for Q (81 = quit)
    LDI r2, 81
    CMP r13, r2
    JNZ r12, unknown_key
    HALT                 ; quit on Q

unknown_key:
    JMP poll             ; ignore unknown keys

move_done:
    PSET r1, r8, r7   ; draw cursor at new position
    JMP poll
