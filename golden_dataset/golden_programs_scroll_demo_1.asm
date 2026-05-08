; DESCRIPTION: This GeOS assembly code draws a bright green bar at y=240 and scrolls it upward by moving each pixel one position up until the bar reaches the top of the screen.

; scroll_demo.asm -- draw a bright bar at y=240 then scroll it upward
; CMP always writes result into r2, so keep x in r5, use r2 only for CMP

LDI r5, 0       ; x counter
LDI r8, 240     ; y
LDI r7, 0x00FF88 ; green bar color
LDI r10, 256     ; x limit (loop until x == 256)

bar_loop:
  PSET r5, r8, r7
  LDI r14, 1
  ADD r5, r14
  CMP r5, r10       ; r2 = 0 if r5==256, else non-zero
  JZ r2, scroll_phase
  JMP bar_loop

scroll_phase:
  LDI r15, 240     ; scroll 240 times = bar reaches top
  LDI r1, 1       ; scroll 1 pixel per step

scroll_loop:
  SCROLL r1
  LDI r13, 1
  SUB r15, r13
  JNZ r15, scroll_loop

HALT
