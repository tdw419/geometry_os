; DESCRIPTION: This GeOS assembly code demonstrates mouse support by drawing a blue gradient background and displaying "MOUSE TEST" in green. It continuously reads mouse coordinates and button status using the `MOUSEQ` opcode, then draws a red crosshair at the mouse position. If a button is pressed, it additionally draws a yellow dot at the cursor location. The program runs in an infinite loop, updating the display with each frame.

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
LDI r13, 0       ; y = 0
LDI r10, 1        ; increment
LDI r1, 256      ; screen width/height limit
y_loop:
  LDI r15, 0      ; x = 0
  x_loop:
    MOV r2, r13
    SHL r2, r10    ; r2 = y * 2 (blue gradient)
    PSETI r15, r13, r2
    ADD r15, r10
    CMP r15, r1
    BLT r12, x_loop
  ADD r13, r10
  CMP r13, r1
  BLT r12, y_loop

; ── Draw title text ──
LDI r12, 0x00FF00
LDI r10, 10       ; x
LDI r15, 5        ; y
TEXTI r10, r15, title, 10

; ── Main loop: read mouse, draw crosshair ──
main_loop:
  MOUSEQ r6       ; r6=mouse_x, r5=mouse_y, r1=button

  ; Draw red crosshair at mouse position (5px horizontal)
  LDI r12, 0xFF0000
  LDI r2, 4       ; width counter
  LDI r7, 0       ; offset
  draw_h:
    PSET r6, r7, r12
    ADD r7, r10
    CMP r7, r2
    BLT r12, draw_h

  ; Draw red crosshair vertical (5px)
  LDI r7, 0
  draw_v:
    PSET r7, r5, r12
    ADD r7, r10
    CMP r7, r2
    BLT r12, draw_v

  ; Yellow dot if button pressed
  CMP r1, r10      ; button >= 1?
  BLT r12, no_click
  LDI r12, 0xFFFF00
  ADD r2, r6
  ADD r2, r10
  ADD r2, r10      ; r2 = mouse_x + 2
  PSET r2, r5, r12
  no_click:

  FRAME
  JMP main_loop

title:
  .db "MOUSE TEST" 0
