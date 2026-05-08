; DESCRIPTION: This GeOS assembly code draws a bright green bar at y=240 and scrolls it upward by moving each pixel one position up until the bar reaches the top of the screen.

; scroll_demo.asm -- draw a bright bar at y=240 then scroll it upward
; CMP always writes result into r2, so keep x in r10, use r2 only for CMP

LDI r10, 0       ; x counter
LDI r7, 240     ; y
LDI r6, 0x00FF88 ; green bar color
LDI r14, 256     ; x limit (loop until x == 256)

bar_loop:
  PSET r10, r7, r6
  LDI r4, 1
  ADD r10, r4
  CMP r10, r14       ; r2 = 0 if r10==256, else non-zero
  JZ r2, scroll_phase
  JMP bar_loop

scroll_phase:
  LDI r15, 240     ; scroll 240 times = bar reaches top
  LDI r9, 1       ; scroll 1 pixel per step

scroll_loop:
  SCROLL r9
  LDI r8, 1
  SUB r15, r8
  JNZ r15, scroll_loop

HALT
