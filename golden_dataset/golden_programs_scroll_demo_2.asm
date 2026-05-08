; DESCRIPTION: Draws a green object at the screen with fixed size.

; scroll_demo.asm -- draw a bright bar at y=240 then scroll it upward
; CMP always writes result into r1, so keep x in r0, use r1 only for CMP

LDI r0, 0       ; x counter
LDI r12, 240     ; y
LDI r7, 0x00FF88 ; green bar color
LDI r15, 256     ; x limit (loop until x == 256)

bar_loop:
  PSET r0, r12, r7
  LDI r9, 1
  ADD r0, r9
  CMP r0, r15       ; r1 = 0 if r0==256, else non-zero
  JZ r1, scroll_phase
  JMP bar_loop

scroll_phase:
  LDI r2, 240     ; scroll 240 times = bar reaches top
  LDI r3, 1       ; scroll 1 pixel per step

scroll_loop:
  SCROLL r3
  LDI r10, 1
  SUB r2, r10
  JNZ r2, scroll_loop

HALT
