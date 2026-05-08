; DESCRIPTION: This GeOS assembly code generates a gradient pattern simulating an image on the screen, draws a UI with a title bar and status bar, and enters a main loop where it handles user input to save screenshots or quit. It uses registers for drawing and managing state, and includes functions for writing filenames and capturing screenshots.

; imgview.asm -- Image Viewer Demo
;
; Generates a gradient pattern (simulating a loaded image),
; draws UI chrome (title bar, status bar), and enters a main loop.
; Press S to save screenshot. Press Q to quit.

; ── Constants ──
LDI r5, 1
LDI r13, 0          ; overlay timer
LDI r1, 256        ; screen dimension

; ── Draw gradient pattern (simulated loaded image) ──
LDI r2, 0          ; y = 0
dg_y:
    LDI r10, 0         ; x = 0
dg_x:
    MOV r7, r10
    LDI r14, 16
    SHL r7, r14        ; R = x << 16
    MOV r0, r2
    LDI r14, 8
    SHL r0, r14        ; G = y << 8
    OR r7, r0
    LDI r0, 128
    OR r7, r0         ; B = 128
    PSET r10, r2, r7
    ADD r10, r5
    LDI r14, 0
    ADD r14, r10
    SUB r14, r1
    JZ r14, dg_next_y
    JMP dg_x
dg_next_y:
    ADD r2, r5
    LDI r14, 0
    ADD r14, r2
    SUB r14, r1
    JZ r14, dg_done
    JMP dg_y
dg_done:

; ── Draw title bar ──
LDI r2, 0
LDI r8, 0
LDI r9, 256
LDI r12, 14
LDI r15, 0x222222
RECTF r2, r8, r9, r12, r15

; Highlight bar
LDI r2, 2
LDI r8, 2
LDI r9, 100
LDI r12, 10
LDI r15, 0x8888FF
RECTF r2, r8, r9, r12, r15

; Status bar at bottom
LDI r2, 0
LDI r8, 244
LDI r9, 256
LDI r12, 12
LDI r15, 0x222222
RECTF r2, r8, r9, r12, r15

; ── Screenshot counter at RAM[0x7000] ──
LDI r4, 0x7000
LDI r16, 0
STORE r4, r16

; ── Main loop ──
main_loop:
    IKEY r10
    ; S key = save screenshot
    LDI r20, 83
    CMP r10, r20
    JZ r2, do_save
    ; Q key = quit
    LDI r20, 81
    CMP r10, r20
    JZ r2, do_quit
    JMP check_overlay

do_save:
    CALL write_filename
    SCRSHOT r8
    ; Increment counter
    LDI r4, 0x7000
    LOAD r16, r4
    ADD r16, r5
    STORE r4, r16
    LDI r13, 60
    JMP check_overlay

check_overlay:
    LDI r20, 0
    CMP r13, r20
    JZ r2, do_frame
    ; Draw saved indicator
    LDI r2, 220
    LDI r8, 2
    LDI r9, 34
    LDI r12, 10
    LDI r15, 0x00CC00
    RECTF r2, r8, r9, r12, r15
    SUB r13, r5
    JMP do_frame

do_quit:
    HALT

do_frame:
    FRAME
    JMP main_loop

; ── Write filename "view_N.img" to RAM at 0x2000 ──
write_filename:
    PUSH r31
    LDI r8, 0x2000
    LDI r14, 118       ; 'v'
    STORE r8, r14
    ADD r8, r5
    LDI r14, 105       ; 'i'
    STORE r8, r14
    ADD r8, r5
    LDI r14, 101       ; 'e'
    STORE r8, r14
    ADD r8, r5
    LDI r14, 119       ; 'w'
    STORE r8, r14
    ADD r8, r5
    LDI r14, 95        ; '_'
    STORE r8, r14
    ADD r8, r5
    ; Append counter as digit
    LDI r4, 0x7000
    LOAD r16, r4
    LDI r14, 48
    ADD r14, r16
    STORE r8, r14
    ADD r8, r5
    LDI r14, 46        ; '.'
    STORE r8, r14
    ADD r8, r5
    LDI r14, 105       ; 'i'
    STORE r8, r14
    ADD r8, r5
    LDI r14, 109       ; 'm'
    STORE r8, r14
    ADD r8, r5
    LDI r14, 103       ; 'g'
    STORE r8, r14
    ADD r8, r5
    LDI r14, 0
    STORE r8, r14
    LDI r8, 0x2000
    POP r31
    RET
