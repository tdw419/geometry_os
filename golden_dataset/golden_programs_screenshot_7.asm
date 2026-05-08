; DESCRIPTION: This GeOS assembly code initializes a screen with a demo pattern consisting of colored rectangles. It captures screenshots when the 'S' key is pressed and saves them to the VFS with names formatted as "shot_N.img", where N is an incrementing counter. After capturing, it displays a green indicator in the top-right corner for approximately one second before returning to the demo pattern.

; screenshot.asm -- Screenshot capture utility
;
; Press S to capture a screenshot, saves to VFS as "shot_N.img".
; Shows a green indicator in top-right corner for ~1 second after capture.
; The screen starts with a demo pattern (colored rectangles).

; ── Draw demo pattern first ──
; Blue background
LDI r1, 0x000044
FILL r1
; Red rectangle top-left
LDI r1, 10
LDI r9, 10
LDI r14, 60
LDI r12, 40
LDI r5, 0xFF0000
RECTF r1, r9, r14, r12, r5
; Green rectangle top-right
LDI r1, 180
LDI r9, 10
LDI r14, 60
LDI r12, 40
LDI r5, 0x00FF00
RECTF r1, r9, r14, r12, r5
; Yellow rectangle center
LDI r1, 100
LDI r9, 100
LDI r14, 56
LDI r12, 56
LDI r5, 0xFFFF00
RECTF r1, r9, r14, r12, r5

; ── Screenshot counter in RAM[0x7000] ──
LDI r15, 1
LDI r4, 0x7000
LDI r16, 0
STORE r4, r16

; ── Overlay timer in r0 ──
LDI r0, 0

; ── Main loop ──
main_loop:
    IKEY r2           ; read key
    LDI r20, 83        ; 'S' key code
    CMP r2, r20
    JZ r1, do_screenshot
    JMP check_overlay

do_screenshot:
    ; Build filename "shot_N.img" in RAM at 0x2000
    CALL write_filename

    ; SCRSHOT - path addr in r9 (set by write_filename)
    SCRSHOT r9

    ; Increment shot counter
    LDI r4, 0x7000
    LOAD r16, r4
    ADD r16, r15
    STORE r4, r16

    ; Set overlay timer (60 frames ~ 1 second)
    LDI r0, 60
    JMP check_overlay

check_overlay:
    ; Show green indicator if timer > 0
    LDI r20, 0
    CMP r0, r20
    JZ r1, skip_overlay

    ; Draw green rectangle in top-right as "saved" indicator
    LDI r1, 230
    LDI r9, 2
    LDI r14, 24
    LDI r12, 8
    LDI r5, 0x00FF00
    RECTF r1, r9, r14, r12, r5
    SUB r0, r15         ; timer--

    JMP do_frame

skip_overlay:
    ; Redraw demo area where overlay was (restore blue background)
    LDI r20, 0
    CMP r0, r20
    JNZ r1, do_frame   ; still showing overlay
    ; Clear overlay area with background color
    LDI r1, 230
    LDI r9, 2
    LDI r14, 24
    LDI r12, 8
    LDI r5, 0x000044
    RECTF r1, r9, r14, r12, r5

do_frame:
    FRAME
    JMP main_loop

; ── Write filename "shot_N.img" to RAM at 0x2000 ──
write_filename:
    PUSH r31
    LDI r9, 0x2000
    ; "shot_"
    LDI r3, 115       ; 's'
    STORE r9, r3
    ADD r9, r15
    LDI r3, 104       ; 'h'
    STORE r9, r3
    ADD r9, r15
    LDI r3, 111       ; 'o'
    STORE r9, r3
    ADD r9, r15
    LDI r3, 116       ; 't'
    STORE r9, r3
    ADD r9, r15
    LDI r3, 95        ; '_'
    STORE r9, r3
    ADD r9, r15
    ; Append shot counter as digit
    LDI r4, 0x7000
    LOAD r16, r4
    LDI r3, 48         ; '0'
    ADD r3, r16
    STORE r9, r3
    ADD r9, r15
    ; ".img"
    LDI r3, 46         ; '.'
    STORE r9, r3
    ADD r9, r15
    LDI r3, 105        ; 'i'
    STORE r9, r3
    ADD r9, r15
    LDI r3, 109        ; 'm'
    STORE r9, r3
    ADD r9, r15
    LDI r3, 103        ; 'g'
    STORE r9, r3
    ADD r9, r15
    LDI r3, 0          ; null terminator
    STORE r9, r3
    ; Restore r9 to point to start of filename
    LDI r9, 0x2000
    POP r31
    RET
