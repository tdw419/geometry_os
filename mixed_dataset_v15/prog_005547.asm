; DESCRIPTION: Draws a yellow rectangle at (66, 14) with width 31 and height 79.
; PLAN: r0=66(x), r1=14(y), r2=31(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 14
LDI r2, 31
LDI r3, 79
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
