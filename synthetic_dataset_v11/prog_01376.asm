; DESCRIPTION: Draws a blue rectangle at (119, 53) with width 99 and height 98.
; PLAN: r0=119(x), r1=53(y), r2=99(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 53
LDI r2, 99
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
