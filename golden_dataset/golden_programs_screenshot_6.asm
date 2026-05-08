; DESCRIPTION: This GeOS assembly code initializes a screen with a demo pattern consisting of colored rectangles. It captures screenshots when the 'S' key is pressed and saves them to the VFS with names formatted as "shot_N.img", where N is an incrementing counter. After capturing, it displays a green indicator in the top-right corner for approximately one second before returning to the demo pattern.

; screenshot.asm -- Screenshot capture utility
;
; Press S to capture a screenshot, saves to VFS as "shot_N.img".
; Shows a green indicator in top-right corner for ~1 second after capture.
; The screen starts with a demo pattern (colored rectangles).

; ── Draw demo pattern first ──
; Blue background
LDI r0, 0x000044
FILL r0
; Red rectangle top-left
LDI r0, 10
LDI r14, 10
LDI r3, 60
LDI r15, 40
LDI r10, 0xFF0000
RECTF r0, r14, r3, r15, r10
; Green rectangle top-right
LDI r0, 180
LDI r14, 10
LDI r3, 60
LDI r15, 40
LDI r10, 0x00FF00
RECTF r0, r14, r3, r15, r10
; Yellow rectangle center
LDI r0, 100
LDI r14, 100
LDI r3, 56
LDI r15, 56
LDI r10, 0xFFFF00
RECTF r0, r14, r3, r15, r10

; ── Screenshot counter in RAM[0x7000] ──
LDI r2, 1
LDI r11, 0x7000
LDI r16, 0
STORE r11, r16

; ── Overlay timer in r1 ──
LDI r1, 0

; ── Main loop ──
main_loop:
    IKEY r6           ; read key
    LDI r20, 83        ; 'S' key code
    CMP r6, r20
    JZ r0, do_screenshot
    JMP check_overlay

do_screenshot:
    ; Build filename "shot_N.img" in RAM at 0x2000
    CALL write_filename

    ; SCRSHOT - path addr in r14 (set by write_filename)
    SCRSHOT r14

    ; Increment shot counter
    LDI r11, 0x7000
    LOAD r16, r11
    ADD r16, r2
    STORE r11, r16

    ; Set overlay timer (60 frames ~ 1 second)
    LDI r1, 60
    JMP check_overlay

check_overlay:
    ; Show green indicator if timer > 0
    LDI r20, 0
    CMP r1, r20
    JZ r0, skip_overlay

    ; Draw green rectangle in top-right as "saved" indicator
    LDI r0, 230
    LDI r14, 2
    LDI r3, 24
    LDI r15, 8
    LDI r10, 0x00FF00
    RECTF r0, r14, r3, r15, r10
    SUB r1, r2         ; timer--

    JMP do_frame

skip_overlay:
    ; Redraw demo area where overlay was (restore blue background)
    LDI r20, 0
    CMP r1, r20
    JNZ r0, do_frame   ; still showing overlay
    ; Clear overlay area with background color
    LDI r0, 230
    LDI r14, 2
    LDI r3, 24
    LDI r15, 8
    LDI r10, 0x000044
    RECTF r0, r14, r3, r15, r10

do_frame:
    FRAME
    JMP main_loop

; ── Write filename "shot_N.img" to RAM at 0x2000 ──
write_filename:
    PUSH r31
    LDI r14, 0x2000
    ; "shot_"
    LDI r4, 115       ; 's'
    STORE r14, r4
    ADD r14, r2
    LDI r4, 104       ; 'h'
    STORE r14, r4
    ADD r14, r2
    LDI r4, 111       ; 'o'
    STORE r14, r4
    ADD r14, r2
    LDI r4, 116       ; 't'
    STORE r14, r4
    ADD r14, r2
    LDI r4, 95        ; '_'
    STORE r14, r4
    ADD r14, r2
    ; Append shot counter as digit
    LDI r11, 0x7000
    LOAD r16, r11
    LDI r4, 48         ; '0'
    ADD r4, r16
    STORE r14, r4
    ADD r14, r2
    ; ".img"
    LDI r4, 46         ; '.'
    STORE r14, r4
    ADD r14, r2
    LDI r4, 105        ; 'i'
    STORE r14, r4
    ADD r14, r2
    LDI r4, 109        ; 'm'
    STORE r14, r4
    ADD r14, r2
    LDI r4, 103        ; 'g'
    STORE r14, r4
    ADD r14, r2
    LDI r4, 0          ; null terminator
    STORE r14, r4
    ; Restore r14 to point to start of filename
    LDI r14, 0x2000
    POP r31
    RET
