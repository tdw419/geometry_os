; DESCRIPTION: This GeOS assembly code draws a bright green bar at y=240 and scrolls it upward by moving each pixel one position up until the bar reaches the top of the screen.

; scroll_demo.asm -- draw a bright bar at y=240 then scroll it upward
; CMP always writes result into r14, so keep x in r13, use r14 only for CMP

LDI r13, 0       ; x counter
LDI r7, 240     ; y
LDI r2, 0x00FF88 ; green bar color
LDI r8, 256     ; x limit (loop until x == 256)

bar_loop:
  PSET r13, r7, r2
  LDI r5, 1
  ADD r13, r5
  CMP r13, r8       ; r14 = 0 if r13==256, else non-zero
  JZ r14, scroll_phase
  JMP bar_loop

scroll_phase:
  LDI r4, 240     ; scroll 240 times = bar reaches top
  LDI r0, 1       ; scroll 1 pixel per step

scroll_loop:
  SCROLL r0
  LDI r12, 1
  SUB r4, r12
  JNZ r4, scroll_loop

HALT
