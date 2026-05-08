; DESCRIPTION: This GeOS assembly code draws a bright green bar at y=240 and scrolls it upward by moving each pixel one position up until the bar reaches the top of the screen.

; scroll_demo.asm -- draw a bright bar at y=240 then scroll it upward
; CMP always writes result into r6, so keep x in r2, use r6 only for CMP

LDI r2, 0       ; x counter
LDI r11, 240     ; y
LDI r9, 0x00FF88 ; green bar color
LDI r10, 256     ; x limit (loop until x == 256)

bar_loop:
  PSET r2, r11, r9
  LDI r13, 1
  ADD r2, r13
  CMP r2, r10       ; r6 = 0 if r2==256, else non-zero
  JZ r6, scroll_phase
  JMP bar_loop

scroll_phase:
  LDI r0, 240     ; scroll 240 times = bar reaches top
  LDI r14, 1       ; scroll 1 pixel per step

scroll_loop:
  SCROLL r14
  LDI r15, 1
  SUB r0, r15
  JNZ r0, scroll_loop

HALT
