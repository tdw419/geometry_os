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
;   r6 = cursor X (starts at 128)
;   r10 = cursor Y (starts at 128)
;   r14 = key port address (0xFFFF)
;   r7 = color register
;   r9 = zero constant (0)
;   r8 = one constant (1)
;   r16 = four constant (4)
;   r17 = saved key address (0x0300)
;   r18 = max paints (5)
;   r13  = paint counter
;   r0  = temp
;   r5  = temp
;   r11  = temp
;   r2  = color cycling offset

; ── Constants ──────────────────────────────────────────────────
    LDI r6, 128         ; cursor X
    LDI r10, 128         ; cursor Y
    LDI r14, 0xFFFF      ; key port address
    LDI r7, 0x00FFFF    ; cursor color (cyan)
    LDI r9, 0           ; zero
    LDI r8, 1           ; one
    LDI r16, 4           ; step size
    LDI r17, 0x0300      ; saved key RAM address
    LDI r18, 5           ; max paints before halt
    LDI r13, 0            ; paint counter
    LDI r2, 0            ; color cycling offset

; ── Store PAINTER signature at RAM[0x0200..0x0207] ─────────
    LDI r0, 0x0200
    LDI r5, 80           ; P
    STORE r0, r5
    ADD r0, r8
    LDI r5, 65           ; A
    STORE r0, r5
    ADD r0, r8
    LDI r5, 73           ; I
    STORE r0, r5
    ADD r0, r8
    LDI r5, 78           ; N
    STORE r0, r5
    ADD r0, r8
    LDI r5, 84           ; T
    STORE r0, r5
    ADD r0, r8
    LDI r5, 69           ; E
    STORE r0, r5
    ADD r0, r8
    LDI r5, 82           ; R
    STORE r0, r5

; ── Draw initial cursor pixel ────────────────────────────────
    PSET r6, r10, r7

; ── Main poll loop ────────────────────────────────────────────
poll:
    LOAD r0, r14         ; r0 = key from port
    CMP r0, r9          ; r3 = 0 if key == 0
    JZ r3, poll          ; no key -> go back to poll

    ; Key pressed -- save key to RAM, then clear port
    STORE r17, r0        ; save key at RAM[0x0300]
    LDI r0, 0
    STORE r14, r0        ; clear keyboard port

    ; Reload saved key
    LOAD r0, r17

; ── Dispatch on key value ────────────────────────────────────

    ; Check for W (87 = up)
    LDI r5, 87
    CMP r0, r5
    JNZ r3, check_s
    SUB r10, r16         ; Y -= 4
    ; Clamp Y >= 0 (if Y underflowed to large value, fix it)
    LDI r5, 252
    CMP r10, r5
    JNZ r3, move_done
    LDI r10, 0
    JMP move_done

check_s:
    ; Check for S (83 = down)
    LDI r5, 83
    CMP r0, r5
    JNZ r3, check_a
    ADD r10, r16         ; Y += 4
    ; Clamp Y <= 252
    LDI r5, 253
    CMP r10, r5
    JNZ r3, move_done
    LDI r10, 252
    JMP move_done

check_a:
    ; Check for A (65 = left)
    LDI r5, 65
    CMP r0, r5
    JNZ r3, check_d
    SUB r6, r16         ; X -= 4
    ; Clamp X >= 0
    LDI r5, 252
    CMP r6, r5
    JNZ r3, move_done
    LDI r6, 0
    JMP move_done

check_d:
    ; Check for D (68 = right)
    LDI r5, 68
    CMP r0, r5
    JNZ r3, check_space
    ADD r6, r16         ; X += 4
    ; Clamp X <= 252
    LDI r5, 253
    CMP r6, r5
    JNZ r3, move_done
    LDI r6, 252
    JMP move_done

check_space:
    ; Check for Space (32 = paint)
    LDI r5, 32
    CMP r0, r5
    JNZ r3, check_q

    ; Compute paint color
    ; Use paint_counter * 50000 + 0xFF
    ; This cycles through colors as counter grows
    LDI r5, 50000
    MUL r5, r13           ; r5 = paint_counter * 50000
    LDI r11, 0xFF
    OR r5, r11            ; ensure some blue channel

    PSET r6, r10, r5    ; paint pixel

    ; Increment paint counter
    ADD r13, r8
    ADD r2, r8

    ; Check if done
    CMP r13, r18
    JNZ r3, paint_done
    HALT                 ; reached max paints

paint_done:
    JMP poll

check_q:
    ; Check for Q (81 = quit)
    LDI r5, 81
    CMP r0, r5
    JNZ r3, unknown_key
    HALT                 ; quit on Q

unknown_key:
    JMP poll             ; ignore unknown keys

move_done:
    PSET r6, r10, r7   ; draw cursor at new position
    JMP poll
