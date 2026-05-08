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
LDI r9, 0       ; y = 0
LDI r10, 1        ; increment
LDI r15, 256      ; screen width/height limit
y_loop:
  LDI r2, 0      ; x = 0
  x_loop:
    MOV r0, r9
    SHL r0, r10    ; r0 = y * 2 (blue gradient)
    PSETI r2, r9, r0
    ADD r2, r10
    CMP r2, r15
    BLT r13, x_loop
  ADD r9, r10
  CMP r9, r15
  BLT r13, y_loop

; ── Draw title text ──
LDI r13, 0x00FF00
LDI r10, 10       ; x
LDI r2, 5        ; y
TEXTI r10, r2, title, 10

; ── Main loop: read mouse, draw crosshair ──
main_loop:
  MOUSEQ r12       ; r12=mouse_x, r3=mouse_y, r15=button

  ; Draw red crosshair at mouse position (5px horizontal)
  LDI r13, 0xFF0000
  LDI r0, 4       ; width counter
  LDI r8, 0       ; offset
  draw_h:
    PSET r12, r8, r13
    ADD r8, r10
    CMP r8, r0
    BLT r13, draw_h

  ; Draw red crosshair vertical (5px)
  LDI r8, 0
  draw_v:
    PSET r8, r3, r13
    ADD r8, r10
    CMP r8, r0
    BLT r13, draw_v

  ; Yellow dot if button pressed
  CMP r15, r10      ; button >= 1?
  BLT r13, no_click
  LDI r13, 0xFFFF00
  ADD r0, r12
  ADD r0, r10
  ADD r0, r10      ; r0 = mouse_x + 2
  PSET r0, r3, r13
  no_click:

  FRAME
  JMP main_loop

title:
  .db "MOUSE TEST" 0
