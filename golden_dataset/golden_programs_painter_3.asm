; DESCRIPTION: Display a rectangle using color red at the screen.

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
;   r15 = key port address (0xFFFF)
;   r14 = color register
;   r10 = zero constant (0)
;   r7 = one constant (1)
;   r16 = four constant (4)
;   r17 = saved key address (0x0300)
;   r18 = max paints (5)
;   r5  = paint counter
;   r11  = temp
;   r0  = temp
;   r9  = temp
;   r3  = color cycling offset

; ── Constants ──────────────────────────────────────────────────
    LDI r2, 128         ; cursor X
    LDI r13, 128         ; cursor Y
    LDI r15, 0xFFFF      ; key port address
    LDI r14, 0x00FFFF    ; cursor color (cyan)
    LDI r10, 0           ; zero
    LDI r7, 1           ; one
    LDI r16, 4           ; step size
    LDI r17, 0x0300      ; saved key RAM address
    LDI r18, 5           ; max paints before halt
    LDI r5, 0            ; paint counter
    LDI r3, 0            ; color cycling offset

; ── Store PAINTER signature at RAM[0x0200..0x0207] ─────────
    LDI r11, 0x0200
    LDI r0, 80           ; P
    STORE r11, r0
    ADD r11, r7
    LDI r0, 65           ; A
    STORE r11, r0
    ADD r11, r7
    LDI r0, 73           ; I
    STORE r11, r0
    ADD r11, r7
    LDI r0, 78           ; N
    STORE r11, r0
    ADD r11, r7
    LDI r0, 84           ; T
    STORE r11, r0
    ADD r11, r7
    LDI r0, 69           ; E
    STORE r11, r0
    ADD r11, r7
    LDI r0, 82           ; R
    STORE r11, r0

; ── Draw initial cursor pixel ────────────────────────────────
    PSET r2, r13, r14

; ── Main poll loop ────────────────────────────────────────────
poll:
    LOAD r11, r15         ; r11 = key from port
    CMP r11, r10          ; r4 = 0 if key == 0
    JZ r4, poll          ; no key -> go back to poll

    ; Key pressed -- save key to RAM, then clear port
    STORE r17, r11        ; save key at RAM[0x0300]
    LDI r11, 0
    STORE r15, r11        ; clear keyboard port

    ; Reload saved key
    LOAD r11, r17

; ── Dispatch on key value ────────────────────────────────────

    ; Check for W (87 = up)
    LDI r0, 87
    CMP r11, r0
    JNZ r4, check_s
    SUB r13, r16         ; Y -= 4
    ; Clamp Y >= 0 (if Y underflowed to large value, fix it)
    LDI r0, 252
    CMP r13, r0
    JNZ r4, move_done
    LDI r13, 0
    JMP move_done

check_s:
    ; Check for S (83 = down)
    LDI r0, 83
    CMP r11, r0
    JNZ r4, check_a
    ADD r13, r16         ; Y += 4
    ; Clamp Y <= 252
    LDI r0, 253
    CMP r13, r0
    JNZ r4, move_done
    LDI r13, 252
    JMP move_done

check_a:
    ; Check for A (65 = left)
    LDI r0, 65
    CMP r11, r0
    JNZ r4, check_d
    SUB r2, r16         ; X -= 4
    ; Clamp X >= 0
    LDI r0, 252
    CMP r2, r0
    JNZ r4, move_done
    LDI r2, 0
    JMP move_done

check_d:
    ; Check for D (68 = right)
    LDI r0, 68
    CMP r11, r0
    JNZ r4, check_space
    ADD r2, r16         ; X += 4
    ; Clamp X <= 252
    LDI r0, 253
    CMP r2, r0
    JNZ r4, move_done
    LDI r2, 252
    JMP move_done

check_space:
    ; Check for Space (32 = paint)
    LDI r0, 32
    CMP r11, r0
    JNZ r4, check_q

    ; Compute paint color
    ; Use paint_counter * 50000 + 0xFF
    ; This cycles through colors as counter grows
    LDI r0, 50000
    MUL r0, r5           ; r0 = paint_counter * 50000
    LDI r9, 0xFF
    OR r0, r9            ; ensure some blue channel

    PSET r2, r13, r0    ; paint pixel

    ; Increment paint counter
    ADD r5, r7
    ADD r3, r7

    ; Check if done
    CMP r5, r18
    JNZ r4, paint_done
    HALT                 ; reached max paints

paint_done:
    JMP poll

check_q:
    ; Check for Q (81 = quit)
    LDI r0, 81
    CMP r11, r0
    JNZ r4, unknown_key
    HALT                 ; quit on Q

unknown_key:
    JMP poll             ; ignore unknown keys

move_done:
    PSET r2, r13, r14   ; draw cursor at new position
    JMP poll
