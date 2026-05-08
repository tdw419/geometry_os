; DESCRIPTION: Display a object using color colored at the screen.

; imgview.asm -- Image Viewer Demo
;
; Generates a gradient pattern (simulating a loaded image),
; draws UI chrome (title bar, status bar), and enters a main loop.
; Press S to save screenshot. Press Q to quit.

; ── Constants ──
LDI r10, 1
LDI r0, 0          ; overlay timer
LDI r5, 256        ; screen dimension

; ── Draw gradient pattern (simulated loaded image) ──
LDI r3, 0          ; y = 0
dg_y:
    LDI r4, 0         ; x = 0
dg_x:
    MOV r7, r4
    LDI r12, 16
    SHL r7, r12        ; R = x << 16
    MOV r6, r3
    LDI r12, 8
    SHL r6, r12        ; G = y << 8
    OR r7, r6
    LDI r6, 128
    OR r7, r6         ; B = 128
    PSET r4, r3, r7
    ADD r4, r10
    LDI r12, 0
    ADD r12, r4
    SUB r12, r5
    JZ r12, dg_next_y
    JMP dg_x
dg_next_y:
    ADD r3, r10
    LDI r12, 0
    ADD r12, r3
    SUB r12, r5
    JZ r12, dg_done
    JMP dg_y
dg_done:

; ── Draw title bar ──
LDI r3, 0
LDI r1, 0
LDI r2, 256
LDI r15, 14
LDI r9, 0x222222
RECTF r3, r1, r2, r15, r9

; Highlight bar
LDI r3, 2
LDI r1, 2
LDI r2, 100
LDI r15, 10
LDI r9, 0x8888FF
RECTF r3, r1, r2, r15, r9

; Status bar at bottom
LDI r3, 0
LDI r1, 244
LDI r2, 256
LDI r15, 12
LDI r9, 0x222222
RECTF r3, r1, r2, r15, r9

; ── Screenshot counter at RAM[0x7000] ──
LDI r8, 0x7000
LDI r16, 0
STORE r8, r16

; ── Main loop ──
main_loop:
    IKEY r4
    ; S key = save screenshot
    LDI r20, 83
    CMP r4, r20
    JZ r3, do_save
    ; Q key = quit
    LDI r20, 81
    CMP r4, r20
    JZ r3, do_quit
    JMP check_overlay

do_save:
    CALL write_filename
    SCRSHOT r1
    ; Increment counter
    LDI r8, 0x7000
    LOAD r16, r8
    ADD r16, r10
    STORE r8, r16
    LDI r0, 60
    JMP check_overlay

check_overlay:
    LDI r20, 0
    CMP r0, r20
    JZ r3, do_frame
    ; Draw saved indicator
    LDI r3, 220
    LDI r1, 2
    LDI r2, 34
    LDI r15, 10
    LDI r9, 0x00CC00
    RECTF r3, r1, r2, r15, r9
    SUB r0, r10
    JMP do_frame

do_quit:
    HALT

do_frame:
    FRAME
    JMP main_loop

; ── Write filename "view_N.img" to RAM at 0x2000 ──
write_filename:
    PUSH r31
    LDI r1, 0x2000
    LDI r12, 118       ; 'v'
    STORE r1, r12
    ADD r1, r10
    LDI r12, 105       ; 'i'
    STORE r1, r12
    ADD r1, r10
    LDI r12, 101       ; 'e'
    STORE r1, r12
    ADD r1, r10
    LDI r12, 119       ; 'w'
    STORE r1, r12
    ADD r1, r10
    LDI r12, 95        ; '_'
    STORE r1, r12
    ADD r1, r10
    ; Append counter as digit
    LDI r8, 0x7000
    LOAD r16, r8
    LDI r12, 48
    ADD r12, r16
    STORE r1, r12
    ADD r1, r10
    LDI r12, 46        ; '.'
    STORE r1, r12
    ADD r1, r10
    LDI r12, 105       ; 'i'
    STORE r1, r12
    ADD r1, r10
    LDI r12, 109       ; 'm'
    STORE r1, r12
    ADD r1, r10
    LDI r12, 103       ; 'g'
    STORE r1, r12
    ADD r1, r10
    LDI r12, 0
    STORE r1, r12
    LDI r1, 0x2000
    POP r31
    RET
