; DESCRIPTION: A red object centered at the screen with fixed size.

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
LDI r9, 0       ; y = 0
LDI r5, 1        ; increment
LDI r14, 256      ; screen width/height limit
y_loop:
  LDI r8, 0      ; x = 0
  x_loop:
    MOV r4, r9
    SHL r4, r5    ; r4 = y * 2 (blue gradient)
    PSETI r8, r9, r4
    ADD r8, r5
    CMP r8, r14
    BLT r13, x_loop
  ADD r9, r5
  CMP r9, r14
  BLT r13, y_loop

; ── Draw title text ──
LDI r13, 0x00FF00
LDI r5, 10       ; x
LDI r8, 5        ; y
TEXTI r5, r8, title, 10

; ── Main loop: read mouse, draw crosshair ──
main_loop:
  MOUSEQ r1       ; r1=mouse_x, r12=mouse_y, r14=button

  ; Draw red crosshair at mouse position (5px horizontal)
  LDI r13, 0xFF0000
  LDI r4, 4       ; width counter
  LDI r15, 0       ; offset
  draw_h:
    PSET r1, r15, r13
    ADD r15, r5
    CMP r15, r4
    BLT r13, draw_h

  ; Draw red crosshair vertical (5px)
  LDI r15, 0
  draw_v:
    PSET r15, r12, r13
    ADD r15, r5
    CMP r15, r4
    BLT r13, draw_v

  ; Yellow dot if button pressed
  CMP r14, r5      ; button >= 1?
  BLT r13, no_click
  LDI r13, 0xFFFF00
  ADD r4, r1
  ADD r4, r5
  ADD r4, r5      ; r4 = mouse_x + 2
  PSET r4, r12, r13
  no_click:

  FRAME
  JMP main_loop

title:
  .db "MOUSE TEST" 0
