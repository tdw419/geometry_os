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
;   r7 = cursor X (starts at 128)
;   r8 = cursor Y (starts at 128)
;   r10 = key port address (0xFFFF)
;   r12 = color register
;   r2 = zero constant (0)
;   r3 = one constant (1)
;   r16 = four constant (4)
;   r17 = saved key address (0x0300)
;   r18 = max paints (5)
;   r1  = paint counter
;   r11  = temp
;   r4  = temp
;   r15  = temp
;   r0  = color cycling offset

; ── Constants ──────────────────────────────────────────────────
    LDI r7, 128         ; cursor X
    LDI r8, 128         ; cursor Y
    LDI r10, 0xFFFF      ; key port address
    LDI r12, 0x00FFFF    ; cursor color (cyan)
    LDI r2, 0           ; zero
    LDI r3, 1           ; one
    LDI r16, 4           ; step size
    LDI r17, 0x0300      ; saved key RAM address
    LDI r18, 5           ; max paints before halt
    LDI r1, 0            ; paint counter
    LDI r0, 0            ; color cycling offset

; ── Store PAINTER signature at RAM[0x0200..0x0207] ─────────
    LDI r11, 0x0200
    LDI r4, 80           ; P
    STORE r11, r4
    ADD r11, r3
    LDI r4, 65           ; A
    STORE r11, r4
    ADD r11, r3
    LDI r4, 73           ; I
    STORE r11, r4
    ADD r11, r3
    LDI r4, 78           ; N
    STORE r11, r4
    ADD r11, r3
    LDI r4, 84           ; T
    STORE r11, r4
    ADD r11, r3
    LDI r4, 69           ; E
    STORE r11, r4
    ADD r11, r3
    LDI r4, 82           ; R
    STORE r11, r4

; ── Draw initial cursor pixel ────────────────────────────────
    PSET r7, r8, r12

; ── Main poll loop ────────────────────────────────────────────
poll:
    LOAD r11, r10         ; r11 = key from port
    CMP r11, r2          ; r13 = 0 if key == 0
    JZ r13, poll          ; no key -> go back to poll

    ; Key pressed -- save key to RAM, then clear port
    STORE r17, r11        ; save key at RAM[0x0300]
    LDI r11, 0
    STORE r10, r11        ; clear keyboard port

    ; Reload saved key
    LOAD r11, r17

; ── Dispatch on key value ────────────────────────────────────

    ; Check for W (87 = up)
    LDI r4, 87
    CMP r11, r4
    JNZ r13, check_s
    SUB r8, r16         ; Y -= 4
    ; Clamp Y >= 0 (if Y underflowed to large value, fix it)
    LDI r4, 252
    CMP r8, r4
    JNZ r13, move_done
    LDI r8, 0
    JMP move_done

check_s:
    ; Check for S (83 = down)
    LDI r4, 83
    CMP r11, r4
    JNZ r13, check_a
    ADD r8, r16         ; Y += 4
    ; Clamp Y <= 252
    LDI r4, 253
    CMP r8, r4
    JNZ r13, move_done
    LDI r8, 252
    JMP move_done

check_a:
    ; Check for A (65 = left)
    LDI r4, 65
    CMP r11, r4
    JNZ r13, check_d
    SUB r7, r16         ; X -= 4
    ; Clamp X >= 0
    LDI r4, 252
    CMP r7, r4
    JNZ r13, move_done
    LDI r7, 0
    JMP move_done

check_d:
    ; Check for D (68 = right)
    LDI r4, 68
    CMP r11, r4
    JNZ r13, check_space
    ADD r7, r16         ; X += 4
    ; Clamp X <= 252
    LDI r4, 253
    CMP r7, r4
    JNZ r13, move_done
    LDI r7, 252
    JMP move_done

check_space:
    ; Check for Space (32 = paint)
    LDI r4, 32
    CMP r11, r4
    JNZ r13, check_q

    ; Compute paint color
    ; Use paint_counter * 50000 + 0xFF
    ; This cycles through colors as counter grows
    LDI r4, 50000
    MUL r4, r1           ; r4 = paint_counter * 50000
    LDI r15, 0xFF
    OR r4, r15            ; ensure some blue channel

    PSET r7, r8, r4    ; paint pixel

    ; Increment paint counter
    ADD r1, r3
    ADD r0, r3

    ; Check if done
    CMP r1, r18
    JNZ r13, paint_done
    HALT                 ; reached max paints

paint_done:
    JMP poll

check_q:
    ; Check for Q (81 = quit)
    LDI r4, 81
    CMP r11, r4
    JNZ r13, unknown_key
    HALT                 ; quit on Q

unknown_key:
    JMP poll             ; ignore unknown keys

move_done:
    PSET r7, r8, r12   ; draw cursor at new position
    JMP poll
