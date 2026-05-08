; DESCRIPTION: This GeOS assembly code initializes a screen with a demo pattern consisting of colored rectangles. It captures screenshots when the 'S' key is pressed and saves them to the VFS with names formatted as "shot_N.img", where N is an incrementing counter. After capturing, it displays a green indicator in the top-right corner for approximately one second before returning to the demo pattern.

; screenshot.asm -- Screenshot capture utility
;
; Press S to capture a screenshot, saves to VFS as "shot_N.img".
; Shows a green indicator in top-right corner for ~1 second after capture.
; The screen starts with a demo pattern (colored rectangles).

; ── Draw demo pattern first ──
; Blue background
LDI r15, 0x000044
FILL r15
; Red rectangle top-left
LDI r15, 10
LDI r2, 10
LDI r14, 60
LDI r3, 40
LDI r13, 0xFF0000
RECTF r15, r2, r14, r3, r13
; Green rectangle top-right
LDI r15, 180
LDI r2, 10
LDI r14, 60
LDI r3, 40
LDI r13, 0x00FF00
RECTF r15, r2, r14, r3, r13
; Yellow rectangle center
LDI r15, 100
LDI r2, 100
LDI r14, 56
LDI r3, 56
LDI r13, 0xFFFF00
RECTF r15, r2, r14, r3, r13

; ── Screenshot counter in RAM[0x7000] ──
LDI r10, 1
LDI r8, 0x7000
LDI r16, 0
STORE r8, r16

; ── Overlay timer in r4 ──
LDI r4, 0

; ── Main loop ──
main_loop:
    IKEY r12           ; read key
    LDI r20, 83        ; 'S' key code
    CMP r12, r20
    JZ r15, do_screenshot
    JMP check_overlay

do_screenshot:
    ; Build filename "shot_N.img" in RAM at 0x2000
    CALL write_filename

    ; SCRSHOT - path addr in r2 (set by write_filename)
    SCRSHOT r2

    ; Increment shot counter
    LDI r8, 0x7000
    LOAD r16, r8
    ADD r16, r10
    STORE r8, r16

    ; Set overlay timer (60 frames ~ 1 second)
    LDI r4, 60
    JMP check_overlay

check_overlay:
    ; Show green indicator if timer > 0
    LDI r20, 0
    CMP r4, r20
    JZ r15, skip_overlay

    ; Draw green rectangle in top-right as "saved" indicator
    LDI r15, 230
    LDI r2, 2
    LDI r14, 24
    LDI r3, 8
    LDI r13, 0x00FF00
    RECTF r15, r2, r14, r3, r13
    SUB r4, r10         ; timer--

    JMP do_frame

skip_overlay:
    ; Redraw demo area where overlay was (restore blue background)
    LDI r20, 0
    CMP r4, r20
    JNZ r15, do_frame   ; still showing overlay
    ; Clear overlay area with background color
    LDI r15, 230
    LDI r2, 2
    LDI r14, 24
    LDI r3, 8
    LDI r13, 0x000044
    RECTF r15, r2, r14, r3, r13

do_frame:
    FRAME
    JMP main_loop

; ── Write filename "shot_N.img" to RAM at 0x2000 ──
write_filename:
    PUSH r31
    LDI r2, 0x2000
    ; "shot_"
    LDI r9, 115       ; 's'
    STORE r2, r9
    ADD r2, r10
    LDI r9, 104       ; 'h'
    STORE r2, r9
    ADD r2, r10
    LDI r9, 111       ; 'o'
    STORE r2, r9
    ADD r2, r10
    LDI r9, 116       ; 't'
    STORE r2, r9
    ADD r2, r10
    LDI r9, 95        ; '_'
    STORE r2, r9
    ADD r2, r10
    ; Append shot counter as digit
    LDI r8, 0x7000
    LOAD r16, r8
    LDI r9, 48         ; '0'
    ADD r9, r16
    STORE r2, r9
    ADD r2, r10
    ; ".img"
    LDI r9, 46         ; '.'
    STORE r2, r9
    ADD r2, r10
    LDI r9, 105        ; 'i'
    STORE r2, r9
    ADD r2, r10
    LDI r9, 109        ; 'm'
    STORE r2, r9
    ADD r2, r10
    LDI r9, 103        ; 'g'
    STORE r2, r9
    ADD r2, r10
    LDI r9, 0          ; null terminator
    STORE r2, r9
    ; Restore r2 to point to start of filename
    LDI r2, 0x2000
    POP r31
    RET
