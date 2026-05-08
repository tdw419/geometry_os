; DESCRIPTION: Geometry OS program to draw a green object.

; scroll_demo.asm -- draw a bright bar at y=240 then scroll it upward
; CMP always writes result into r11, so keep x in r3, use r11 only for CMP

LDI r3, 0       ; x counter
LDI r1, 240     ; y
LDI r10, 0x00FF88 ; green bar color
LDI r9, 256     ; x limit (loop until x == 256)

bar_loop:
  PSET r3, r1, r10
  LDI r6, 1
  ADD r3, r6
  CMP r3, r9       ; r11 = 0 if r3==256, else non-zero
  JZ r11, scroll_phase
  JMP bar_loop

scroll_phase:
  LDI r12, 240     ; scroll 240 times = bar reaches top
  LDI r14, 1       ; scroll 1 pixel per step

scroll_loop:
  SCROLL r14
  LDI r0, 1
  SUB r12, r0
  JNZ r12, scroll_loop

HALT
