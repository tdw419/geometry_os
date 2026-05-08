; DESCRIPTION: Draws a green object at the screen with fixed size.

; scroll_demo.asm -- draw a bright bar at y=240 then scroll it upward
; CMP always writes result into r11, so keep x in r14, use r11 only for CMP

LDI r14, 0       ; x counter
LDI r7, 240     ; y
LDI r6, 0x00FF88 ; green bar color
LDI r4, 256     ; x limit (loop until x == 256)

bar_loop:
  PSET r14, r7, r6
  LDI r1, 1
  ADD r14, r1
  CMP r14, r4       ; r11 = 0 if r14==256, else non-zero
  JZ r11, scroll_phase
  JMP bar_loop

scroll_phase:
  LDI r13, 240     ; scroll 240 times = bar reaches top
  LDI r10, 1       ; scroll 1 pixel per step

scroll_loop:
  SCROLL r10
  LDI r2, 1
  SUB r13, r2
  JNZ r13, scroll_loop

HALT
