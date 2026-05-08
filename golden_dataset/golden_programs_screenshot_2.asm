; DESCRIPTION: Draws a red rectangle at the screen with fixed size.

; screenshot.asm -- Screenshot capture utility
;
; Press S to capture a screenshot, saves to VFS as "shot_N.img".
; Shows a green indicator in top-right corner for ~1 second after capture.
; The screen starts with a demo pattern (colored rectangles).

; ── Draw demo pattern first ──
; Blue background
LDI r12, 0x000044
FILL r12
; Red rectangle top-left
LDI r12, 10
LDI r1, 10
LDI r0, 60
LDI r15, 40
LDI r13, 0xFF0000
RECTF r12, r1, r0, r15, r13
; Green rectangle top-right
LDI r12, 180
LDI r1, 10
LDI r0, 60
LDI r15, 40
LDI r13, 0x00FF00
RECTF r12, r1, r0, r15, r13
; Yellow rectangle center
LDI r12, 100
LDI r1, 100
LDI r0, 56
LDI r15, 56
LDI r13, 0xFFFF00
RECTF r12, r1, r0, r15, r13

; ── Screenshot counter in RAM[0x7000] ──
LDI r2, 1
LDI r6, 0x7000
LDI r16, 0
STORE r6, r16

; ── Overlay timer in r8 ──
LDI r8, 0

; ── Main loop ──
main_loop:
    IKEY r7           ; read key
    LDI r20, 83        ; 'S' key code
    CMP r7, r20
    JZ r12, do_screenshot
    JMP check_overlay

do_screenshot:
    ; Build filename "shot_N.img" in RAM at 0x2000
    CALL write_filename

    ; SCRSHOT - path addr in r1 (set by write_filename)
    SCRSHOT r1

    ; Increment shot counter
    LDI r6, 0x7000
    LOAD r16, r6
    ADD r16, r2
    STORE r6, r16

    ; Set overlay timer (60 frames ~ 1 second)
    LDI r8, 60
    JMP check_overlay

check_overlay:
    ; Show green indicator if timer > 0
    LDI r20, 0
    CMP r8, r20
    JZ r12, skip_overlay

    ; Draw green rectangle in top-right as "saved" indicator
    LDI r12, 230
    LDI r1, 2
    LDI r0, 24
    LDI r15, 8
    LDI r13, 0x00FF00
    RECTF r12, r1, r0, r15, r13
    SUB r8, r2         ; timer--

    JMP do_frame

skip_overlay:
    ; Redraw demo area where overlay was (restore blue background)
    LDI r20, 0
    CMP r8, r20
    JNZ r12, do_frame   ; still showing overlay
    ; Clear overlay area with background color
    LDI r12, 230
    LDI r1, 2
    LDI r0, 24
    LDI r15, 8
    LDI r13, 0x000044
    RECTF r12, r1, r0, r15, r13

do_frame:
    FRAME
    JMP main_loop

; ── Write filename "shot_N.img" to RAM at 0x2000 ──
write_filename:
    PUSH r31
    LDI r1, 0x2000
    ; "shot_"
    LDI r14, 115       ; 's'
    STORE r1, r14
    ADD r1, r2
    LDI r14, 104       ; 'h'
    STORE r1, r14
    ADD r1, r2
    LDI r14, 111       ; 'o'
    STORE r1, r14
    ADD r1, r2
    LDI r14, 116       ; 't'
    STORE r1, r14
    ADD r1, r2
    LDI r14, 95        ; '_'
    STORE r1, r14
    ADD r1, r2
    ; Append shot counter as digit
    LDI r6, 0x7000
    LOAD r16, r6
    LDI r14, 48         ; '0'
    ADD r14, r16
    STORE r1, r14
    ADD r1, r2
    ; ".img"
    LDI r14, 46         ; '.'
    STORE r1, r14
    ADD r1, r2
    LDI r14, 105        ; 'i'
    STORE r1, r14
    ADD r1, r2
    LDI r14, 109        ; 'm'
    STORE r1, r14
    ADD r1, r2
    LDI r14, 103        ; 'g'
    STORE r1, r14
    ADD r1, r2
    LDI r14, 0          ; null terminator
    STORE r1, r14
    ; Restore r1 to point to start of filename
    LDI r1, 0x2000
    POP r31
    RET
