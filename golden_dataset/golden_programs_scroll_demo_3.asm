; DESCRIPTION: Display a object using color green at the screen.

; scroll_demo.asm -- draw a bright bar at y=240 then scroll it upward
; CMP always writes result into r15, so keep x in r9, use r15 only for CMP

LDI r9, 0       ; x counter
LDI r6, 240     ; y
LDI r1, 0x00FF88 ; green bar color
LDI r4, 256     ; x limit (loop until x == 256)

bar_loop:
  PSET r9, r6, r1
  LDI r12, 1
  ADD r9, r12
  CMP r9, r4       ; r15 = 0 if r9==256, else non-zero
  JZ r15, scroll_phase
  JMP bar_loop

scroll_phase:
  LDI r11, 240     ; scroll 240 times = bar reaches top
  LDI r3, 1       ; scroll 1 pixel per step

scroll_loop:
  SCROLL r3
  LDI r8, 1
  SUB r11, r8
  JNZ r11, scroll_loop

HALT
