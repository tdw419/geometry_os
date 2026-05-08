; DESCRIPTION: Render a red rectangle at the screen.

; screenshot.asm -- Screenshot capture utility
;
; Press S to capture a screenshot, saves to VFS as "shot_N.img".
; Shows a green indicator in top-right corner for ~1 second after capture.
; The screen starts with a demo pattern (colored rectangles).

; ── Draw demo pattern first ──
; Blue background
LDI r10, 0x000044
FILL r10
; Red rectangle top-left
LDI r10, 10
LDI r8, 10
LDI r4, 60
LDI r5, 40
LDI r2, 0xFF0000
RECTF r10, r8, r4, r5, r2
; Green rectangle top-right
LDI r10, 180
LDI r8, 10
LDI r4, 60
LDI r5, 40
LDI r2, 0x00FF00
RECTF r10, r8, r4, r5, r2
; Yellow rectangle center
LDI r10, 100
LDI r8, 100
LDI r4, 56
LDI r5, 56
LDI r2, 0xFFFF00
RECTF r10, r8, r4, r5, r2

; ── Screenshot counter in RAM[0x7000] ──
LDI r9, 1
LDI r13, 0x7000
LDI r16, 0
STORE r13, r16

; ── Overlay timer in r14 ──
LDI r14, 0

; ── Main loop ──
main_loop:
    IKEY r0           ; read key
    LDI r20, 83        ; 'S' key code
    CMP r0, r20
    JZ r10, do_screenshot
    JMP check_overlay

do_screenshot:
    ; Build filename "shot_N.img" in RAM at 0x2000
    CALL write_filename

    ; SCRSHOT - path addr in r8 (set by write_filename)
    SCRSHOT r8

    ; Increment shot counter
    LDI r13, 0x7000
    LOAD r16, r13
    ADD r16, r9
    STORE r13, r16

    ; Set overlay timer (60 frames ~ 1 second)
    LDI r14, 60
    JMP check_overlay

check_overlay:
    ; Show green indicator if timer > 0
    LDI r20, 0
    CMP r14, r20
    JZ r10, skip_overlay

    ; Draw green rectangle in top-right as "saved" indicator
    LDI r10, 230
    LDI r8, 2
    LDI r4, 24
    LDI r5, 8
    LDI r2, 0x00FF00
    RECTF r10, r8, r4, r5, r2
    SUB r14, r9         ; timer--

    JMP do_frame

skip_overlay:
    ; Redraw demo area where overlay was (restore blue background)
    LDI r20, 0
    CMP r14, r20
    JNZ r10, do_frame   ; still showing overlay
    ; Clear overlay area with background color
    LDI r10, 230
    LDI r8, 2
    LDI r4, 24
    LDI r5, 8
    LDI r2, 0x000044
    RECTF r10, r8, r4, r5, r2

do_frame:
    FRAME
    JMP main_loop

; ── Write filename "shot_N.img" to RAM at 0x2000 ──
write_filename:
    PUSH r31
    LDI r8, 0x2000
    ; "shot_"
    LDI r7, 115       ; 's'
    STORE r8, r7
    ADD r8, r9
    LDI r7, 104       ; 'h'
    STORE r8, r7
    ADD r8, r9
    LDI r7, 111       ; 'o'
    STORE r8, r7
    ADD r8, r9
    LDI r7, 116       ; 't'
    STORE r8, r7
    ADD r8, r9
    LDI r7, 95        ; '_'
    STORE r8, r7
    ADD r8, r9
    ; Append shot counter as digit
    LDI r13, 0x7000
    LOAD r16, r13
    LDI r7, 48         ; '0'
    ADD r7, r16
    STORE r8, r7
    ADD r8, r9
    ; ".img"
    LDI r7, 46         ; '.'
    STORE r8, r7
    ADD r8, r9
    LDI r7, 105        ; 'i'
    STORE r8, r7
    ADD r8, r9
    LDI r7, 109        ; 'm'
    STORE r8, r7
    ADD r8, r9
    LDI r7, 103        ; 'g'
    STORE r8, r7
    ADD r8, r9
    LDI r7, 0          ; null terminator
    STORE r8, r7
    ; Restore r8 to point to start of filename
    LDI r8, 0x2000
    POP r31
    RET
