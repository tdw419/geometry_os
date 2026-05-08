; DESCRIPTION: A green object centered at the screen with fixed size.

; scroll_demo.asm -- draw a bright bar at y=240 then scroll it upward
; CMP always writes result into r3, so keep x in r6, use r3 only for CMP

LDI r6, 0       ; x counter
LDI r12, 240     ; y
LDI r4, 0x00FF88 ; green bar color
LDI r2, 256     ; x limit (loop until x == 256)

bar_loop:
  PSET r6, r12, r4
  LDI r7, 1
  ADD r6, r7
  CMP r6, r2       ; r3 = 0 if r6==256, else non-zero
  JZ r3, scroll_phase
  JMP bar_loop

scroll_phase:
  LDI r10, 240     ; scroll 240 times = bar reaches top
  LDI r14, 1       ; scroll 1 pixel per step

scroll_loop:
  SCROLL r14
  LDI r11, 1
  SUB r10, r11
  JNZ r10, scroll_loop

HALT
