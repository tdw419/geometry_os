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
;   r1 = cursor X (starts at 128)
;   r8 = cursor Y (starts at 128)
;   r12 = key port address (0xFFFF)
;   r11 = color register
;   r14 = zero constant (0)
;   r13 = one constant (1)
;   r16 = four constant (4)
;   r17 = saved key address (0x0300)
;   r18 = max paints (5)
;   r0  = paint counter
;   r7  = temp
;   r6  = temp
;   r15  = temp
;   r10  = color cycling offset

; ── Constants ──────────────────────────────────────────────────
    LDI r1, 128         ; cursor X
    LDI r8, 128         ; cursor Y
    LDI r12, 0xFFFF      ; key port address
    LDI r11, 0x00FFFF    ; cursor color (cyan)
    LDI r14, 0           ; zero
    LDI r13, 1           ; one
    LDI r16, 4           ; step size
    LDI r17, 0x0300      ; saved key RAM address
    LDI r18, 5           ; max paints before halt
    LDI r0, 0            ; paint counter
    LDI r10, 0            ; color cycling offset

; ── Store PAINTER signature at RAM[0x0200..0x0207] ─────────
    LDI r7, 0x0200
    LDI r6, 80           ; P
    STORE r7, r6
    ADD r7, r13
    LDI r6, 65           ; A
    STORE r7, r6
    ADD r7, r13
    LDI r6, 73           ; I
    STORE r7, r6
    ADD r7, r13
    LDI r6, 78           ; N
    STORE r7, r6
    ADD r7, r13
    LDI r6, 84           ; T
    STORE r7, r6
    ADD r7, r13
    LDI r6, 69           ; E
    STORE r7, r6
    ADD r7, r13
    LDI r6, 82           ; R
    STORE r7, r6

; ── Draw initial cursor pixel ────────────────────────────────
    PSET r1, r8, r11

; ── Main poll loop ────────────────────────────────────────────
poll:
    LOAD r7, r12         ; r7 = key from port
    CMP r7, r14          ; r4 = 0 if key == 0
    JZ r4, poll          ; no key -> go back to poll

    ; Key pressed -- save key to RAM, then clear port
    STORE r17, r7        ; save key at RAM[0x0300]
    LDI r7, 0
    STORE r12, r7        ; clear keyboard port

    ; Reload saved key
    LOAD r7, r17

; ── Dispatch on key value ────────────────────────────────────

    ; Check for W (87 = up)
    LDI r6, 87
    CMP r7, r6
    JNZ r4, check_s
    SUB r8, r16         ; Y -= 4
    ; Clamp Y >= 0 (if Y underflowed to large value, fix it)
    LDI r6, 252
    CMP r8, r6
    JNZ r4, move_done
    LDI r8, 0
    JMP move_done

check_s:
    ; Check for S (83 = down)
    LDI r6, 83
    CMP r7, r6
    JNZ r4, check_a
    ADD r8, r16         ; Y += 4
    ; Clamp Y <= 252
    LDI r6, 253
    CMP r8, r6
    JNZ r4, move_done
    LDI r8, 252
    JMP move_done

check_a:
    ; Check for A (65 = left)
    LDI r6, 65
    CMP r7, r6
    JNZ r4, check_d
    SUB r1, r16         ; X -= 4
    ; Clamp X >= 0
    LDI r6, 252
    CMP r1, r6
    JNZ r4, move_done
    LDI r1, 0
    JMP move_done

check_d:
    ; Check for D (68 = right)
    LDI r6, 68
    CMP r7, r6
    JNZ r4, check_space
    ADD r1, r16         ; X += 4
    ; Clamp X <= 252
    LDI r6, 253
    CMP r1, r6
    JNZ r4, move_done
    LDI r1, 252
    JMP move_done

check_space:
    ; Check for Space (32 = paint)
    LDI r6, 32
    CMP r7, r6
    JNZ r4, check_q

    ; Compute paint color
    ; Use paint_counter * 50000 + 0xFF
    ; This cycles through colors as counter grows
    LDI r6, 50000
    MUL r6, r0           ; r6 = paint_counter * 50000
    LDI r15, 0xFF
    OR r6, r15            ; ensure some blue channel

    PSET r1, r8, r6    ; paint pixel

    ; Increment paint counter
    ADD r0, r13
    ADD r10, r13

    ; Check if done
    CMP r0, r18
    JNZ r4, paint_done
    HALT                 ; reached max paints

paint_done:
    JMP poll

check_q:
    ; Check for Q (81 = quit)
    LDI r6, 81
    CMP r7, r6
    JNZ r4, unknown_key
    HALT                 ; quit on Q

unknown_key:
    JMP poll             ; ignore unknown keys

move_done:
    PSET r1, r8, r11   ; draw cursor at new position
    JMP poll
