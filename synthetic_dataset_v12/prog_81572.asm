; DESCRIPTION: Draws a green rectangle at (94, 79) with width 96 and height 52.
; PLAN: r0=94(x), r1=79(y), r2=96(width), r3=52(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 79
LDI r2, 96
LDI r3, 52
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
