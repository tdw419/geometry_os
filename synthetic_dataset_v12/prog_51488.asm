; DESCRIPTION: Draws a blue rectangle at (181, 138) with width 57 and height 84.
; PLAN: r0=181(x), r1=138(y), r2=57(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 138
LDI r2, 57
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
