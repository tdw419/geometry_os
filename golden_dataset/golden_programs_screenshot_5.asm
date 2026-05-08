; DESCRIPTION: This GeOS assembly code initializes a screen with a demo pattern consisting of colored rectangles. It captures screenshots when the 'S' key is pressed and saves them to the VFS with names formatted as "shot_N.img", where N is an incrementing counter. After capturing, it displays a green indicator in the top-right corner for approximately one second before returning to the demo pattern.

; screenshot.asm -- Screenshot capture utility
;
; Press S to capture a screenshot, saves to VFS as "shot_N.img".
; Shows a green indicator in top-right corner for ~1 second after capture.
; The screen starts with a demo pattern (colored rectangles).

; ── Draw demo pattern first ──
; Blue background
LDI r3, 0x000044
FILL r3
; Red rectangle top-left
LDI r3, 10
LDI r13, 10
LDI r2, 60
LDI r10, 40
LDI r14, 0xFF0000
RECTF r3, r13, r2, r10, r14
; Green rectangle top-right
LDI r3, 180
LDI r13, 10
LDI r2, 60
LDI r10, 40
LDI r14, 0x00FF00
RECTF r3, r13, r2, r10, r14
; Yellow rectangle center
LDI r3, 100
LDI r13, 100
LDI r2, 56
LDI r10, 56
LDI r14, 0xFFFF00
RECTF r3, r13, r2, r10, r14

; ── Screenshot counter in RAM[0x7000] ──
LDI r9, 1
LDI r15, 0x7000
LDI r16, 0
STORE r15, r16

; ── Overlay timer in r4 ──
LDI r4, 0

; ── Main loop ──
main_loop:
    IKEY r7           ; read key
    LDI r20, 83        ; 'S' key code
    CMP r7, r20
    JZ r3, do_screenshot
    JMP check_overlay

do_screenshot:
    ; Build filename "shot_N.img" in RAM at 0x2000
    CALL write_filename

    ; SCRSHOT - path addr in r13 (set by write_filename)
    SCRSHOT r13

    ; Increment shot counter
    LDI r15, 0x7000
    LOAD r16, r15
    ADD r16, r9
    STORE r15, r16

    ; Set overlay timer (60 frames ~ 1 second)
    LDI r4, 60
    JMP check_overlay

check_overlay:
    ; Show green indicator if timer > 0
    LDI r20, 0
    CMP r4, r20
    JZ r3, skip_overlay

    ; Draw green rectangle in top-right as "saved" indicator
    LDI r3, 230
    LDI r13, 2
    LDI r2, 24
    LDI r10, 8
    LDI r14, 0x00FF00
    RECTF r3, r13, r2, r10, r14
    SUB r4, r9         ; timer--

    JMP do_frame

skip_overlay:
    ; Redraw demo area where overlay was (restore blue background)
    LDI r20, 0
    CMP r4, r20
    JNZ r3, do_frame   ; still showing overlay
    ; Clear overlay area with background color
    LDI r3, 230
    LDI r13, 2
    LDI r2, 24
    LDI r10, 8
    LDI r14, 0x000044
    RECTF r3, r13, r2, r10, r14

do_frame:
    FRAME
    JMP main_loop

; ── Write filename "shot_N.img" to RAM at 0x2000 ──
write_filename:
    PUSH r31
    LDI r13, 0x2000
    ; "shot_"
    LDI r5, 115       ; 's'
    STORE r13, r5
    ADD r13, r9
    LDI r5, 104       ; 'h'
    STORE r13, r5
    ADD r13, r9
    LDI r5, 111       ; 'o'
    STORE r13, r5
    ADD r13, r9
    LDI r5, 116       ; 't'
    STORE r13, r5
    ADD r13, r9
    LDI r5, 95        ; '_'
    STORE r13, r5
    ADD r13, r9
    ; Append shot counter as digit
    LDI r15, 0x7000
    LOAD r16, r15
    LDI r5, 48         ; '0'
    ADD r5, r16
    STORE r13, r5
    ADD r13, r9
    ; ".img"
    LDI r5, 46         ; '.'
    STORE r13, r5
    ADD r13, r9
    LDI r5, 105        ; 'i'
    STORE r13, r5
    ADD r13, r9
    LDI r5, 109        ; 'm'
    STORE r13, r5
    ADD r13, r9
    LDI r5, 103        ; 'g'
    STORE r13, r5
    ADD r13, r9
    LDI r5, 0          ; null terminator
    STORE r13, r5
    ; Restore r13 to point to start of filename
    LDI r13, 0x2000
    POP r31
    RET
