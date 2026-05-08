; DESCRIPTION: This GeOS assembly code initializes a screen with a demo pattern consisting of colored rectangles. It captures screenshots when the 'S' key is pressed and saves them to the VFS with names formatted as "shot_N.img", where N is an incrementing counter. After capturing, it displays a green indicator in the top-right corner for approximately one second before returning to the demo pattern.

; screenshot.asm -- Screenshot capture utility
;
; Press S to capture a screenshot, saves to VFS as "shot_N.img".
; Shows a green indicator in top-right corner for ~1 second after capture.
; The screen starts with a demo pattern (colored rectangles).

; ── Draw demo pattern first ──
; Blue background
LDI r2, 0x000044
FILL r2
; Red rectangle top-left
LDI r2, 10
LDI r10, 10
LDI r0, 60
LDI r13, 40
LDI r5, 0xFF0000
RECTF r2, r10, r0, r13, r5
; Green rectangle top-right
LDI r2, 180
LDI r10, 10
LDI r0, 60
LDI r13, 40
LDI r5, 0x00FF00
RECTF r2, r10, r0, r13, r5
; Yellow rectangle center
LDI r2, 100
LDI r10, 100
LDI r0, 56
LDI r13, 56
LDI r5, 0xFFFF00
RECTF r2, r10, r0, r13, r5

; ── Screenshot counter in RAM[0x7000] ──
LDI r12, 1
LDI r9, 0x7000
LDI r16, 0
STORE r9, r16

; ── Overlay timer in r1 ──
LDI r1, 0

; ── Main loop ──
main_loop:
    IKEY r7           ; read key
    LDI r20, 83        ; 'S' key code
    CMP r7, r20
    JZ r2, do_screenshot
    JMP check_overlay

do_screenshot:
    ; Build filename "shot_N.img" in RAM at 0x2000
    CALL write_filename

    ; SCRSHOT - path addr in r10 (set by write_filename)
    SCRSHOT r10

    ; Increment shot counter
    LDI r9, 0x7000
    LOAD r16, r9
    ADD r16, r12
    STORE r9, r16

    ; Set overlay timer (60 frames ~ 1 second)
    LDI r1, 60
    JMP check_overlay

check_overlay:
    ; Show green indicator if timer > 0
    LDI r20, 0
    CMP r1, r20
    JZ r2, skip_overlay

    ; Draw green rectangle in top-right as "saved" indicator
    LDI r2, 230
    LDI r10, 2
    LDI r0, 24
    LDI r13, 8
    LDI r5, 0x00FF00
    RECTF r2, r10, r0, r13, r5
    SUB r1, r12         ; timer--

    JMP do_frame

skip_overlay:
    ; Redraw demo area where overlay was (restore blue background)
    LDI r20, 0
    CMP r1, r20
    JNZ r2, do_frame   ; still showing overlay
    ; Clear overlay area with background color
    LDI r2, 230
    LDI r10, 2
    LDI r0, 24
    LDI r13, 8
    LDI r5, 0x000044
    RECTF r2, r10, r0, r13, r5

do_frame:
    FRAME
    JMP main_loop

; ── Write filename "shot_N.img" to RAM at 0x2000 ──
write_filename:
    PUSH r31
    LDI r10, 0x2000
    ; "shot_"
    LDI r8, 115       ; 's'
    STORE r10, r8
    ADD r10, r12
    LDI r8, 104       ; 'h'
    STORE r10, r8
    ADD r10, r12
    LDI r8, 111       ; 'o'
    STORE r10, r8
    ADD r10, r12
    LDI r8, 116       ; 't'
    STORE r10, r8
    ADD r10, r12
    LDI r8, 95        ; '_'
    STORE r10, r8
    ADD r10, r12
    ; Append shot counter as digit
    LDI r9, 0x7000
    LOAD r16, r9
    LDI r8, 48         ; '0'
    ADD r8, r16
    STORE r10, r8
    ADD r10, r12
    ; ".img"
    LDI r8, 46         ; '.'
    STORE r10, r8
    ADD r10, r12
    LDI r8, 105        ; 'i'
    STORE r10, r8
    ADD r10, r12
    LDI r8, 109        ; 'm'
    STORE r10, r8
    ADD r10, r12
    LDI r8, 103        ; 'g'
    STORE r10, r8
    ADD r10, r12
    LDI r8, 0          ; null terminator
    STORE r10, r8
    ; Restore r10 to point to start of filename
    LDI r10, 0x2000
    POP r31
    RET
