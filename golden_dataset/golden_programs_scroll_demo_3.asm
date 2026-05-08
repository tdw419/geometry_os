; DESCRIPTION: This GeOS assembly code draws a bright green bar at y=240 and scrolls it upward by moving each pixel one position up until the bar reaches the top of the screen.

; scroll_demo.asm -- draw a bright bar at y=240 then scroll it upward
; CMP always writes result into r9, so keep x in r12, use r9 only for CMP

LDI r12, 0       ; x counter
LDI r10, 240     ; y
LDI r14, 0x00FF88 ; green bar color
LDI r13, 256     ; x limit (loop until x == 256)

bar_loop:
  PSET r12, r10, r14
  LDI r3, 1
  ADD r12, r3
  CMP r12, r13       ; r9 = 0 if r12==256, else non-zero
  JZ r9, scroll_phase
  JMP bar_loop

scroll_phase:
  LDI r2, 240     ; scroll 240 times = bar reaches top
  LDI r5, 1       ; scroll 1 pixel per step

scroll_loop:
  SCROLL r5
  LDI r4, 1
  SUB r2, r4
  JNZ r2, scroll_loop

HALT
