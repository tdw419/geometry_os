; DESCRIPTION: Render a green object at the screen.

; scroll_demo.asm -- draw a bright bar at y=240 then scroll it upward
; CMP always writes result into r3, so keep x in r6, use r3 only for CMP

LDI r6, 0       ; x counter
LDI r10, 240     ; y
LDI r4, 0x00FF88 ; green bar color
LDI r5, 256     ; x limit (loop until x == 256)

bar_loop:
  PSET r6, r10, r4
  LDI r1, 1
  ADD r6, r1
  CMP r6, r5       ; r3 = 0 if r6==256, else non-zero
  JZ r3, scroll_phase
  JMP bar_loop

scroll_phase:
  LDI r13, 240     ; scroll 240 times = bar reaches top
  LDI r2, 1       ; scroll 1 pixel per step

scroll_loop:
  SCROLL r2
  LDI r14, 1
  SUB r13, r14
  JNZ r13, scroll_loop

HALT
