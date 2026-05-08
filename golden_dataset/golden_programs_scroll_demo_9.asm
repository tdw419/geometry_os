; DESCRIPTION: This GeOS assembly code draws a bright green bar at y=240 and scrolls it upward by moving each pixel one position up until the bar reaches the top of the screen.

; scroll_demo.asm -- draw a bright bar at y=240 then scroll it upward
; CMP always writes result into r15, so keep x in r0, use r15 only for CMP

LDI r0, 0       ; x counter
LDI r13, 240     ; y
LDI r9, 0x00FF88 ; green bar color
LDI r11, 256     ; x limit (loop until x == 256)

bar_loop:
  PSET r0, r13, r9
  LDI r8, 1
  ADD r0, r8
  CMP r0, r11       ; r15 = 0 if r0==256, else non-zero
  JZ r15, scroll_phase
  JMP bar_loop

scroll_phase:
  LDI r3, 240     ; scroll 240 times = bar reaches top
  LDI r6, 1       ; scroll 1 pixel per step

scroll_loop:
  SCROLL r6
  LDI r10, 1
  SUB r3, r10
  JNZ r3, scroll_loop

HALT
