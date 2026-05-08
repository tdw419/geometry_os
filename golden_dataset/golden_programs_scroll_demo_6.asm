; DESCRIPTION: Display a object using color green at the screen.

; scroll_demo.asm -- draw a bright bar at y=240 then scroll it upward
; CMP always writes result into r13, so keep x in r7, use r13 only for CMP

LDI r7, 0       ; x counter
LDI r0, 240     ; y
LDI r10, 0x00FF88 ; green bar color
LDI r15, 256     ; x limit (loop until x == 256)

bar_loop:
  PSET r7, r0, r10
  LDI r11, 1
  ADD r7, r11
  CMP r7, r15       ; r13 = 0 if r7==256, else non-zero
  JZ r13, scroll_phase
  JMP bar_loop

scroll_phase:
  LDI r1, 240     ; scroll 240 times = bar reaches top
  LDI r12, 1       ; scroll 1 pixel per step

scroll_loop:
  SCROLL r12
  LDI r6, 1
  SUB r1, r6
  JNZ r1, scroll_loop

HALT
