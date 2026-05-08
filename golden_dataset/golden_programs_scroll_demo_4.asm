; DESCRIPTION: Draws a green object at the screen with fixed size.

; scroll_demo.asm -- draw a bright bar at y=240 then scroll it upward
; CMP always writes result into r8, so keep x in r0, use r8 only for CMP

LDI r0, 0       ; x counter
LDI r1, 240     ; y
LDI r9, 0x00FF88 ; green bar color
LDI r12, 256     ; x limit (loop until x == 256)

bar_loop:
  PSET r0, r1, r9
  LDI r2, 1
  ADD r0, r2
  CMP r0, r12       ; r8 = 0 if r0==256, else non-zero
  JZ r8, scroll_phase
  JMP bar_loop

scroll_phase:
  LDI r5, 240     ; scroll 240 times = bar reaches top
  LDI r11, 1       ; scroll 1 pixel per step

scroll_loop:
  SCROLL r11
  LDI r13, 1
  SUB r5, r13
  JNZ r5, scroll_loop

HALT
