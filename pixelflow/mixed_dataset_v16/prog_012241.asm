; DESCRIPTION: Draws a blue rectangle at (383, 137) with width 27 and height 49.
; PLAN: r0=383(x), r1=137(y), r2=27(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 137
LDI r2, 27
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
