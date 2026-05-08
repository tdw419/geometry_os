; DESCRIPTION: Geometry OS program to draw a red object.

; Mouse Support Demo - Phase 217
; Demonstrates MOUSEQ and IMOUSE opcodes for GUI programs
;
; MOUSEQ rd: reads mouse_x -> rd, mouse_y -> rd+1, button -> rd+2
;   button: 0=none, 1=left down, 2=left click (auto-cleared)
; IMOUSE rd: reads next event from ring buffer
;   rd = packed event (bits[7:0]=type, bits[15:8]=button)
;   rd+1 = full X, rd+2 = full Y
;   returns 0 in all if no event pending
;
; Usage: Run this program, then inject mouse events via host API
; push_mouse(x, y) and push_mouse_button(button)

; ── Draw blue gradient background ──
LDI r12, 0       ; y = 0
LDI r4, 1        ; increment
LDI r6, 256      ; screen width/height limit
y_loop:
  LDI r0, 0      ; x = 0
  x_loop:
    MOV r3, r12
    SHL r3, r4    ; r3 = y * 2 (blue gradient)
    PSETI r0, r12, r3
    ADD r0, r4
    CMP r0, r6
    BLT r9, x_loop
  ADD r12, r4
  CMP r12, r6
  BLT r9, y_loop

; ── Draw title text ──
LDI r9, 0x00FF00
LDI r4, 10       ; x
LDI r0, 5        ; y
TEXTI r4, r0, title, 10

; ── Main loop: read mouse, draw crosshair ──
main_loop:
  MOUSEQ r13       ; r13=mouse_x, r1=mouse_y, r6=button

  ; Draw red crosshair at mouse position (5px horizontal)
  LDI r9, 0xFF0000
  LDI r3, 4       ; width counter
  LDI r15, 0       ; offset
  draw_h:
    PSET r13, r15, r9
    ADD r15, r4
    CMP r15, r3
    BLT r9, draw_h

  ; Draw red crosshair vertical (5px)
  LDI r15, 0
  draw_v:
    PSET r15, r1, r9
    ADD r15, r4
    CMP r15, r3
    BLT r9, draw_v

  ; Yellow dot if button pressed
  CMP r6, r4      ; button >= 1?
  BLT r9, no_click
  LDI r9, 0xFFFF00
  ADD r3, r13
  ADD r3, r4
  ADD r3, r4      ; r3 = mouse_x + 2
  PSET r3, r1, r9
  no_click:

  FRAME
  JMP main_loop

title:
  .db "MOUSE TEST" 0
