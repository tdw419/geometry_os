; editor.asm -- Minimal Memory Palace Source Code Editor
; Self-hosting: type assembly source, Esc+A to assemble+run.
;
; Memory:
;   0x0800..3FFF  text buffer (byte-addressed via STOREB)
;   0x4000..7FFF  ASM output buffer
;
; Registers (fixed):
;   r9   = 1  (constant increment)
;   r10  = buffer write ptr (starts at 0x0800)
;   r11  = 0x0800 (source buffer base, constant)
;   r12  = 0x4000 (asm output base, constant)
;   r13  = cursor_col (0..41)
;   r14  = cursor_row

    LDI  r11, 0x0800
    LDI  r12, 0x4000
    LDI  r9,  1
    MOV  r10, r11
    LDI  r13, 0         ; col = 0
    LDI  r14, 0         ; row = 0

    ; clear screen
    LDI  r0, 0x001010
    FILL r0

    ; show empty buffer
    LDI  r0, 0
    LDI  r1, 0
    LDI  r2, 0x0800
    TEXT r0, r1, r2

; ───── MAIN LOOP ─────
loop:
    IKEY r1
    LDI  r2, 0
    CMP  r1, r2
    JZ   r0, loop

    ; Escape -> command mode
    LDI  r2, 27
    CMP  r1, r2
    JZ   r0, cmd

    ; Enter -> newline
    LDI  r2, 13
    CMP  r1, r2
    JZ   r0, enter_key

    ; Backspace -> delete
    LDI  r2, 8
    CMP  r1, r2
    JZ   r0, bs_key

    ; printable (32-126) -> insert
    LDI  r2, 32
    CMP  r1, r2
    BLT  r0, loop
    LDI  r2, 126
    CMP  r1, r2
    BGE  r0, loop

    ; Insert character
    STOREB r10, r1
    ADD  r10, r9

    ; cursor_col++
    ADD  r13, r9
    LDI  r2, 42
    CMP  r13, r2
    BLT  r0, redraw

    ; wrap: col=0, row++
    LDI  r13, 0
    ADD  r14, r9
    JMP  redraw

enter_key:
    LDI  r2, 10          ; LF
    STOREB r10, r2
    ADD  r10, r9
    LDI  r13, 0          ; col=0
    ADD  r14, r9         ; row++
    JMP  redraw

bs_key:
    CMP  r10, r11
    JZ   r0, loop        ; at start, ignore
    SUB  r10, r9
    LDI  r2, 0
    STOREB r10, r2       ; null at new end

    ; cursor_back
    LDI  r2, 0
    CMP  r13, r2
    JNZ  r0, bs_dec_col
    ; col=0, go to prev row
    LDI  r2, 0
    CMP  r14, r2
    JZ   r0, redraw      ; row=0, at top
    SUB  r14, r9         ; row--
    LDI  r13, 41         ; col = 41
    JMP  redraw
bs_dec_col:
    SUB  r13, r9
    JMP  redraw

; ───── COMMAND MODE ─────
cmd:
    IKEY r1
    LDI  r2, 0
    CMP  r1, r2
    JZ   r0, cmd

    ; A/a -> Assemble
    LDI  r2, 65
    CMP  r1, r2
    JZ   r0, assemble
    LDI  r2, 97
    CMP  r1, r2
    JZ   r0, assemble

    ; S/s -> Save
    LDI  r2, 83
    CMP  r1, r2
    JZ   r0, save_file
    LDI  r2, 115
    CMP  r1, r2
    JZ   r0, save_file

    ; L/l -> Load
    LDI  r2, 76
    CMP  r1, r2
    JZ   r0, load_file
    LDI  r2, 108
    CMP  r1, r2
    JZ   r0, load_file

    ; Q/q -> Quit
    LDI  r2, 81
    CMP  r1, r2
    JZ   r0, quit
    LDI  r2, 113
    CMP  r1, r2
    JZ   r0, quit

    ; Esc -> back to edit
    LDI  r2, 27
    CMP  r1, r2
    JZ   r0, loop
    JMP  cmd

assemble:
    LDI  r2, 0
    STOREB r10, r2        ; null-terminate source
    ASM  r11, r12
    LDI  r5, 0xFFD
    LOAD r2, r5           ; r2 = RAM[0xFFD] (assembly result)
    LDI  r3, 0xFFFFFFFF
    CMP  r2, r3
    JZ   r0, asm_err
    LDI  r0, 0x000000
    FILL r0
    JMP  0x4000           ; jump to assembled code

asm_err:
    ; Show error: write "ERR\0" at 0x2000
    LDI  r5, 0x2000
    LDI  r2, 69           ; E
    STOREB r5, r2
    ADD  r5, r9
    LDI  r2, 82           ; R
    STOREB r5, r2
    ADD  r5, r9
    LDI  r2, 82           ; R
    STOREB r5, r2
    ADD  r5, r9
    LDI  r2, 0
    STOREB r5, r2
    LDI  r0, 0x202020     ; gray screen
    FILL r0
    LDI  r0, 0
    LDI  r1, 120
    LDI  r2, 0x2000
    TEXT r0, r1, r2
    HALT

quit:
    HALT

; ───── SAVE FILE ─────
save_file:
    ; Show "Ring:" prompt at (120, 0)
    LDI  r0, 0
    LDI  r1, 120
    LDI  r5, 0x3000
    LDI  r6, 82
    STOREB r5, r6
    ADD  r5, r9
    LDI  r6, 105
    STOREB r5, r6
    ADD  r5, r9
    LDI  r6, 110
    STOREB r5, r6
    ADD  r5, r9
    LDI  r6, 103
    STOREB r5, r6
    ADD  r5, r9
    LDI  r6, 58
    STOREB r5, r6
    ADD  r5, r9
    LDI  r6, 0
    STOREB r5, r6
    LDI  r2, 0x3000
    TEXT r0, r1, r2

    ; Read ring (single digit 0-9)
    IKEY r1
    LDI  r2, 0
    CMP  r1, r2
    JZ   r0, cmd
    LDI  r2, 48
    CMP  r1, r2
    BLT  r0, cmd
    LDI  r2, 57
    CMP  r1, r2
    BLT  r2, cmd
    SUB  r1, r2
    LDI  r15, 0
    ADD  r15, r1

    ; Show "Angle:" prompt at (120, 8)
    LDI  r0, 0
    LDI  r1, 128
    LDI  r5, 0x3000
    LDI  r6, 65
    STOREB r5, r6
    ADD  r5, r9
    LDI  r6, 110
    STOREB r5, r6
    ADD  r5, r9
    LDI  r6, 103
    STOREB r5, r6
    ADD  r5, r9
    LDI  r6, 108
    STOREB r5, r6
    ADD  r5, r9
    LDI  r6, 101
    STOREB r5, r6
    ADD  r5, r9
    LDI  r6, 58
    STOREB r5, r6
    ADD  r5, r9
    LDI  r6, 0
    STOREB r5, r6
    LDI r2, 0x3000
    TEXT r0, r1, r2

    ; Read angle (single digit 0-9)
    IKEY r1
    LDI  r2, 0
    CMP  r1, r2
    JZ   r0, cmd
    LDI  r2, 48
    CMP  r1, r2
    BLT  r0, cmd
    LDI  r2, 57
    CMP  r1, r2
    BLT  r2, cmd
    SUB  r1, r2
    LDI  r14, 0
    ADD  r14, r1

    ; Prepare FILEOPEN instruction at 0x5000
    ; FILEOPEN r15 (ring), r14 (angle) - opcode 0x0D
    LDI  r5, 0x5000
    LDI  r6, 0x0D
    STORE r5, r6
    ADD  r5, r9
    LDI  r6, 15
    STORE r5, r6
    ADD  r5, r9
    LDI  r6, 14
    STORE r5, r6
    ADD  r5, r9
    LDI  r6, 0
    STORE r5, r6         ; HALT after FILEOPEN

    ; Execute FILEOPEN
    JMP  0x5000

    ; After FILEOPEN, r0 contains fd
    MOV  r15, r0         ; save fd in r15

    ; Check if fd is valid
    LDI  r5, 0x7000
    CMP  r15, r5
    BLT  r0, save_err

    ; Compute buffer length: r10 - r11
    MOV  r5, r10
    SUB  r5, r11
    MOV  r14, r5         ; r14 = length

    ; Prepare FILEWRITE instruction at 0x5000
    ; FILEWRITE r15 (fd), r11 (buffer), r14 (length) - opcode 0x0F
    LDI  r5, 0x5000
    LDI  r6, 0x0F
    STORE r5, r6
    ADD  r5, r9
    LDI  r6, 15
    STORE r5, r6
    ADD  r5, r9
    LDI  r6, 11
    STORE r5, r6
    ADD  r5, r9
    LDI  r6, 14
    STORE r5, r6
    ADD  r5, r9
    LDI  r6, 0
    STORE r5, r6         ; HALT after FILEWRITE

    ; Execute FILEWRITE
    JMP  0x5000

    ; Show "OK"
    LDI  r0, 0x008000
    FILL r0
    LDI  r0, 0
    LDI  r1, 120
    LDI  r5, 0x3000
    LDI  r6, 79
    STOREB r5, r6
    ADD  r5, r9
    LDI  r6, 75
    STOREB r5, r6
    ADD  r5, r9
    LDI  r6, 0
    STOREB r5, r6
    LDI r2, 0x3000
    TEXT r0, r1, r2
    JMP  cmd

save_err:
    LDI  r0, 0x002020
    FILL r0
    LDI  r0, 0
    LDI  r1, 120
    LDI  r5, 0x2000
    LDI  r6, 69
    STOREB r5, r6
    ADD  r5, r9
    LDI  r6, 82
    STOREB r5, r6
    ADD  r5, r9
    LDI  r6, 82
    STOREB r5, r6
    ADD  r5, r9
    LDI  r6, 0
    STOREB r5, r6
    LDI r2, 0x2000
    TEXT r0, r1, r2
    JMP  cmd

; ───── LOAD FILE ─────
load_file:
    ; Show "Ring:" prompt
    LDI  r0, 0
    LDI  r1, 120
    LDI  r5, 0x3000
    LDI  r6, 82
    STOREB r5, r6
    ADD  r5, r9
    LDI  r6, 105
    STOREB r5, r6
    ADD  r5, r9
    LDI  r6, 110
    STOREB r5, r6
    ADD  r5, r9
    LDI  r6, 103
    STOREB r5, r6
    ADD  r5, r9
    LDI  r6, 58
    STOREB r5, r6
    ADD  r5, r9
    LDI  r6, 0
    STOREB r5, r6
    LDI r2, 0x3000
    TEXT r0, r1, r2

    IKEY r1
    LDI  r2, 0
    CMP  r1, r2
    JZ   r0, cmd
    LDI  r2, 48
    CMP  r1, r2
    BLT  r0, cmd
    LDI  r2, 57
    CMP  r1, r2
    BLT  r2, cmd
    SUB  r1, r2
    LDI  r15, 0
    ADD  r15, r1

    ; Show "Angle:" prompt
    LDI  r0, 0
    LDI  r1, 128
    LDI  r5, 0x3000
    LDI  r6, 65
    STOREB r5, r6
    ADD  r5, r9
    LDI  r6, 110
    STOREB r5, r6
    ADD  r5, r9
    LDI  r6, 103
    STOREB r5, r6
    ADD  r5, r9
    LDI  r6, 108
    STOREB r5, r6
    ADD  r5, r9
    LDI  r6, 101
    STOREB r5, r6
    ADD  r5, r9
    LDI  r6, 58
    STOREB r5, r6
    ADD  r5, r9
    LDI  r6, 0
    STOREB r5, r6
    LDI r2, 0x3000
    TEXT r0, r1, r2

    IKEY r1
    LDI  r2, 0
    CMP  r1, r2
    JZ   r0, cmd
    LDI  r2, 48
    CMP  r1, r2
    BLT  r0, cmd
    LDI  r2, 57
    CMP  r1, r2
    BLT  r2, cmd
    SUB  r1, r2
    LDI  r14, 0
    ADD  r14, r1

    ; Prepare FILEOPEN at 0x5000
    LDI  r5, 0x5000
    LDI  r6, 0x0D
    STORE r5, r6
    ADD  r5, r9
    LDI  r6, 15
    STORE r5, r6
    ADD  r5, r9
    LDI  r6, 14
    STORE r5, r6
    ADD  r5, r9
    LDI  r6, 0
    STORE r5, r6

    JMP  0x5000

    MOV  r15, r0
    LDI  r5, 0x7000
    CMP  r15, r5
    BLT  r0, load_err

    ; Reset buffer
    MOV  r10, r11
    LDI  r13, 0
    LDI  r14, 0

    ; Load 2000 into r5
    LDI  r5, 2000

    ; Prepare FILEREAD at 0x5000 - read up to 2000 bytes
    LDI  r6, 0x5000
    LDI  r7, 0x0E
    STORE r6, r7
    ADD  r6, r9
    LDI  r7, 15
    STORE r6, r7
    ADD  r6, r9
    LDI  r7, 11
    STORE r6, r7
    ADD  r6, r9
    LDI  r7, 5
    STORE r6, r7
    ADD  r6, r9
    LDI  r7, 0
    STORE r6, r7

    JMP  0x5000

    ; Update buffer pointer
    MOV  r5, r0
    ADD  r10, r5

    ; Show "OK"
    LDI  r0, 0x008000
    FILL r0
    LDI  r0, 0
    LDI  r1, 120
    LDI  r5, 0x3000
    LDI  r6, 79
    STOREB r5, r6
    ADD  r5, r9
    LDI  r6, 75
    STOREB r5, r6
    ADD  r5, r9
    LDI  r6, 0
    STOREB r5, r6
    LDI  r2, 0x3000
    TEXT r0, r1, r2
    JMP  redraw

load_err:
    LDI  r0, 0x002020
    FILL r0
    LDI  r0, 0
    LDI  r1, 120
    LDI  r5, 0x2000
    LDI  r6, 69
    STOREB r5, r6
    ADD  r5, r9
    LDI  r6, 82
    STOREB r5, r6
    ADD  r5, r9
    LDI  r6, 82
    STOREB r5, r6
    ADD  r5, r9
    LDI  r6, 0
    STOREB r5, r6
    LDI r2, 0x2000
    TEXT r0, r1, r2
    JMP  cmd

; ───── RENDER ─────
redraw:
    LDI  r0, 0
    LDI  r1, 0
    LDI  r2, 0x0800
    TEXT r0, r1, r2
    JMP  loop
