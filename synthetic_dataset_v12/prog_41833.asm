; DESCRIPTION: Draws a green rectangle at (24, 79) with width 84 and height 114.
; PLAN: r0=24(x), r1=79(y), r2=84(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 79
LDI r2, 84
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
