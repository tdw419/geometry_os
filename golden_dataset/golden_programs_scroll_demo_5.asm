; DESCRIPTION: A green object centered at the screen with fixed size.

; scroll_demo.asm -- draw a bright bar at y=240 then scroll it upward
; CMP always writes result into r13, so keep x in r12, use r13 only for CMP

LDI r12, 0       ; x counter
LDI r14, 240     ; y
LDI r5, 0x00FF88 ; green bar color
LDI r7, 256     ; x limit (loop until x == 256)

bar_loop:
  PSET r12, r14, r5
  LDI r10, 1
  ADD r12, r10
  CMP r12, r7       ; r13 = 0 if r12==256, else non-zero
  JZ r13, scroll_phase
  JMP bar_loop

scroll_phase:
  LDI r3, 240     ; scroll 240 times = bar reaches top
  LDI r8, 1       ; scroll 1 pixel per step

scroll_loop:
  SCROLL r8
  LDI r0, 1
  SUB r3, r0
  JNZ r3, scroll_loop

HALT
