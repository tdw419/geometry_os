; DESCRIPTION: This GeOS assembly code initializes a screen with a demo pattern consisting of colored rectangles. It captures screenshots when the 'S' key is pressed and saves them to the VFS with names formatted as "shot_N.img", where N is an incrementing counter. After capturing, it displays a green indicator in the top-right corner for approximately one second before returning to the demo pattern.

; screenshot.asm -- Screenshot capture utility
;
; Press S to capture a screenshot, saves to VFS as "shot_N.img".
; Shows a green indicator in top-right corner for ~1 second after capture.
; The screen starts with a demo pattern (colored rectangles).

; ── Draw demo pattern first ──
; Blue background
LDI r4, 0x000044
FILL r4
; Red rectangle top-left
LDI r4, 10
LDI r12, 10
LDI r13, 60
LDI r5, 40
LDI r3, 0xFF0000
RECTF r4, r12, r13, r5, r3
; Green rectangle top-right
LDI r4, 180
LDI r12, 10
LDI r13, 60
LDI r5, 40
LDI r3, 0x00FF00
RECTF r4, r12, r13, r5, r3
; Yellow rectangle center
LDI r4, 100
LDI r12, 100
LDI r13, 56
LDI r5, 56
LDI r3, 0xFFFF00
RECTF r4, r12, r13, r5, r3

; ── Screenshot counter in RAM[0x7000] ──
LDI r15, 1
LDI r14, 0x7000
LDI r16, 0
STORE r14, r16

; ── Overlay timer in r9 ──
LDI r9, 0

; ── Main loop ──
main_loop:
    IKEY r7           ; read key
    LDI r20, 83        ; 'S' key code
    CMP r7, r20
    JZ r4, do_screenshot
    JMP check_overlay

do_screenshot:
    ; Build filename "shot_N.img" in RAM at 0x2000
    CALL write_filename

    ; SCRSHOT - path addr in r12 (set by write_filename)
    SCRSHOT r12

    ; Increment shot counter
    LDI r14, 0x7000
    LOAD r16, r14
    ADD r16, r15
    STORE r14, r16

    ; Set overlay timer (60 frames ~ 1 second)
    LDI r9, 60
    JMP check_overlay

check_overlay:
    ; Show green indicator if timer > 0
    LDI r20, 0
    CMP r9, r20
    JZ r4, skip_overlay

    ; Draw green rectangle in top-right as "saved" indicator
    LDI r4, 230
    LDI r12, 2
    LDI r13, 24
    LDI r5, 8
    LDI r3, 0x00FF00
    RECTF r4, r12, r13, r5, r3
    SUB r9, r15         ; timer--

    JMP do_frame

skip_overlay:
    ; Redraw demo area where overlay was (restore blue background)
    LDI r20, 0
    CMP r9, r20
    JNZ r4, do_frame   ; still showing overlay
    ; Clear overlay area with background color
    LDI r4, 230
    LDI r12, 2
    LDI r13, 24
    LDI r5, 8
    LDI r3, 0x000044
    RECTF r4, r12, r13, r5, r3

do_frame:
    FRAME
    JMP main_loop

; ── Write filename "shot_N.img" to RAM at 0x2000 ──
write_filename:
    PUSH r31
    LDI r12, 0x2000
    ; "shot_"
    LDI r11, 115       ; 's'
    STORE r12, r11
    ADD r12, r15
    LDI r11, 104       ; 'h'
    STORE r12, r11
    ADD r12, r15
    LDI r11, 111       ; 'o'
    STORE r12, r11
    ADD r12, r15
    LDI r11, 116       ; 't'
    STORE r12, r11
    ADD r12, r15
    LDI r11, 95        ; '_'
    STORE r12, r11
    ADD r12, r15
    ; Append shot counter as digit
    LDI r14, 0x7000
    LOAD r16, r14
    LDI r11, 48         ; '0'
    ADD r11, r16
    STORE r12, r11
    ADD r12, r15
    ; ".img"
    LDI r11, 46         ; '.'
    STORE r12, r11
    ADD r12, r15
    LDI r11, 105        ; 'i'
    STORE r12, r11
    ADD r12, r15
    LDI r11, 109        ; 'm'
    STORE r12, r11
    ADD r12, r15
    LDI r11, 103        ; 'g'
    STORE r12, r11
    ADD r12, r15
    LDI r11, 0          ; null terminator
    STORE r12, r11
    ; Restore r12 to point to start of filename
    LDI r12, 0x2000
    POP r31
    RET
