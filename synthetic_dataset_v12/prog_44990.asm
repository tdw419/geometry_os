; DESCRIPTION: Draws a green rectangle at (312, 52) with width 116 and height 79.
; PLAN: r0=312(x), r1=52(y), r2=116(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 52
LDI r2, 116
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
