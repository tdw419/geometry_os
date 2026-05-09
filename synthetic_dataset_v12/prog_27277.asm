; DESCRIPTION: Draws a yellow rectangle at (265, 64) with width 79 and height 110.
; PLAN: r0=265(x), r1=64(y), r2=79(width), r3=110(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 64
LDI r2, 79
LDI r3, 110
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
