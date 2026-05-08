; DESCRIPTION: This GeOS assembly code draws a bright green bar at y=240 and scrolls it upward by moving each pixel one position up until the bar reaches the top of the screen.

; scroll_demo.asm -- draw a bright bar at y=240 then scroll it upward
; CMP always writes result into r12, so keep x in r8, use r12 only for CMP

LDI r8, 0       ; x counter
LDI r15, 240     ; y
LDI r14, 0x00FF88 ; green bar color
LDI r9, 256     ; x limit (loop until x == 256)

bar_loop:
  PSET r8, r15, r14
  LDI r13, 1
  ADD r8, r13
  CMP r8, r9       ; r12 = 0 if r8==256, else non-zero
  JZ r12, scroll_phase
  JMP bar_loop

scroll_phase:
  LDI r1, 240     ; scroll 240 times = bar reaches top
  LDI r2, 1       ; scroll 1 pixel per step

scroll_loop:
  SCROLL r2
  LDI r10, 1
  SUB r1, r10
  JNZ r1, scroll_loop

HALT
