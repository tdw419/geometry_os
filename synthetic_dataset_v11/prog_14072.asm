; DESCRIPTION: Draws a blue rectangle at (61, 137) with width 101 and height 87.
; PLAN: r0=61(x), r1=137(y), r2=101(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 137
LDI r2, 101
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
