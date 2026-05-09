; DESCRIPTION: Draws a purple rectangle at (149, 59) with width 84 and height 89.
; PLAN: r0=149(x), r1=59(y), r2=84(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 59
LDI r2, 84
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
