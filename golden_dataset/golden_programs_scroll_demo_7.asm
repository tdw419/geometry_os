; DESCRIPTION: This GeOS assembly code draws a bright green bar at y=240 and scrolls it upward by moving each pixel one position up until the bar reaches the top of the screen.

; scroll_demo.asm -- draw a bright bar at y=240 then scroll it upward
; CMP always writes result into r0, so keep x in r10, use r0 only for CMP

LDI r10, 0       ; x counter
LDI r14, 240     ; y
LDI r2, 0x00FF88 ; green bar color
LDI r1, 256     ; x limit (loop until x == 256)

bar_loop:
  PSET r10, r14, r2
  LDI r13, 1
  ADD r10, r13
  CMP r10, r1       ; r0 = 0 if r10==256, else non-zero
  JZ r0, scroll_phase
  JMP bar_loop

scroll_phase:
  LDI r9, 240     ; scroll 240 times = bar reaches top
  LDI r8, 1       ; scroll 1 pixel per step

scroll_loop:
  SCROLL r8
  LDI r6, 1
  SUB r9, r6
  JNZ r9, scroll_loop

HALT
