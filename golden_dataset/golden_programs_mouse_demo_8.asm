; DESCRIPTION: Draws a red object at the screen with fixed size.

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
LDI r1, 0       ; y = 0
LDI r13, 1        ; increment
LDI r15, 256      ; screen width/height limit
y_loop:
  LDI r3, 0      ; x = 0
  x_loop:
    MOV r0, r1
    SHL r0, r13    ; r0 = y * 2 (blue gradient)
    PSETI r3, r1, r0
    ADD r3, r13
    CMP r3, r15
    BLT r10, x_loop
  ADD r1, r13
  CMP r1, r15
  BLT r10, y_loop

; ── Draw title text ──
LDI r10, 0x00FF00
LDI r13, 10       ; x
LDI r3, 5        ; y
TEXTI r13, r3, title, 10

; ── Main loop: read mouse, draw crosshair ──
main_loop:
  MOUSEQ r2       ; r2=mouse_x, r6=mouse_y, r15=button

  ; Draw red crosshair at mouse position (5px horizontal)
  LDI r10, 0xFF0000
  LDI r0, 4       ; width counter
  LDI r4, 0       ; offset
  draw_h:
    PSET r2, r4, r10
    ADD r4, r13
    CMP r4, r0
    BLT r10, draw_h

  ; Draw red crosshair vertical (5px)
  LDI r4, 0
  draw_v:
    PSET r4, r6, r10
    ADD r4, r13
    CMP r4, r0
    BLT r10, draw_v

  ; Yellow dot if button pressed
  CMP r15, r13      ; button >= 1?
  BLT r10, no_click
  LDI r10, 0xFFFF00
  ADD r0, r2
  ADD r0, r13
  ADD r0, r13      ; r0 = mouse_x + 2
  PSET r0, r6, r10
  no_click:

  FRAME
  JMP main_loop

title:
  .db "MOUSE TEST" 0
