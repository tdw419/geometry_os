; DESCRIPTION: Draws a green rectangle at (84, 14) with width 23 and height 116.
; PLAN: r0=84(x), r1=14(y), r2=23(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 14
LDI r2, 23
LDI r3, 116
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
