; DESCRIPTION: This GeOS assembly code draws a bright green bar at y=240 and scrolls it upward by moving each pixel one position up until the bar reaches the top of the screen.

; scroll_demo.asm -- draw a bright bar at y=240 then scroll it upward
; CMP always writes result into r15, so keep x in r1, use r15 only for CMP

LDI r1, 0       ; x counter
LDI r4, 240     ; y
LDI r2, 0x00FF88 ; green bar color
LDI r8, 256     ; x limit (loop until x == 256)

bar_loop:
  PSET r1, r4, r2
  LDI r9, 1
  ADD r1, r9
  CMP r1, r8       ; r15 = 0 if r1==256, else non-zero
  JZ r15, scroll_phase
  JMP bar_loop

scroll_phase:
  LDI r7, 240     ; scroll 240 times = bar reaches top
  LDI r13, 1       ; scroll 1 pixel per step

scroll_loop:
  SCROLL r13
  LDI r3, 1
  SUB r7, r3
  JNZ r7, scroll_loop

HALT
