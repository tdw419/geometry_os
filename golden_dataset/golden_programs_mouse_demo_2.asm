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
LDI r4, 0       ; y = 0
LDI r6, 1        ; increment
LDI r9, 256      ; screen width/height limit
y_loop:
  LDI r12, 0      ; x = 0
  x_loop:
    MOV r15, r4
    SHL r15, r6    ; r15 = y * 2 (blue gradient)
    PSETI r12, r4, r15
    ADD r12, r6
    CMP r12, r9
    BLT r5, x_loop
  ADD r4, r6
  CMP r4, r9
  BLT r5, y_loop

; ── Draw title text ──
LDI r5, 0x00FF00
LDI r6, 10       ; x
LDI r12, 5        ; y
TEXTI r6, r12, title, 10

; ── Main loop: read mouse, draw crosshair ──
main_loop:
  MOUSEQ r8       ; r8=mouse_x, r10=mouse_y, r9=button

  ; Draw red crosshair at mouse position (5px horizontal)
  LDI r5, 0xFF0000
  LDI r15, 4       ; width counter
  LDI r1, 0       ; offset
  draw_h:
    PSET r8, r1, r5
    ADD r1, r6
    CMP r1, r15
    BLT r5, draw_h

  ; Draw red crosshair vertical (5px)
  LDI r1, 0
  draw_v:
    PSET r1, r10, r5
    ADD r1, r6
    CMP r1, r15
    BLT r5, draw_v

  ; Yellow dot if button pressed
  CMP r9, r6      ; button >= 1?
  BLT r5, no_click
  LDI r5, 0xFFFF00
  ADD r15, r8
  ADD r15, r6
  ADD r15, r6      ; r15 = mouse_x + 2
  PSET r15, r10, r5
  no_click:

  FRAME
  JMP main_loop

title:
  .db "MOUSE TEST" 0
