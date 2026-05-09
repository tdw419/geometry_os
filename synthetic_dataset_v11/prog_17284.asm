; DESCRIPTION: Draws a white rectangle at (84, 99) with width 73 and height 46.
; PLAN: r0=84(x), r1=99(y), r2=73(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 99
LDI r2, 73
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
