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
LDI r10, 0       ; y = 0
LDI r9, 1        ; increment
LDI r2, 256      ; screen width/height limit
y_loop:
  LDI r15, 0      ; x = 0
  x_loop:
    MOV r5, r10
    SHL r5, r9    ; r5 = y * 2 (blue gradient)
    PSETI r15, r10, r5
    ADD r15, r9
    CMP r15, r2
    BLT r14, x_loop
  ADD r10, r9
  CMP r10, r2
  BLT r14, y_loop

; ── Draw title text ──
LDI r14, 0x00FF00
LDI r9, 10       ; x
LDI r15, 5        ; y
TEXTI r9, r15, title, 10

; ── Main loop: read mouse, draw crosshair ──
main_loop:
  MOUSEQ r4       ; r4=mouse_x, r1=mouse_y, r2=button

  ; Draw red crosshair at mouse position (5px horizontal)
  LDI r14, 0xFF0000
  LDI r5, 4       ; width counter
  LDI r12, 0       ; offset
  draw_h:
    PSET r4, r12, r14
    ADD r12, r9
    CMP r12, r5
    BLT r14, draw_h

  ; Draw red crosshair vertical (5px)
  LDI r12, 0
  draw_v:
    PSET r12, r1, r14
    ADD r12, r9
    CMP r12, r5
    BLT r14, draw_v

  ; Yellow dot if button pressed
  CMP r2, r9      ; button >= 1?
  BLT r14, no_click
  LDI r14, 0xFFFF00
  ADD r5, r4
  ADD r5, r9
  ADD r5, r9      ; r5 = mouse_x + 2
  PSET r5, r1, r14
  no_click:

  FRAME
  JMP main_loop

title:
  .db "MOUSE TEST" 0
