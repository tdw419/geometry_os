; DESCRIPTION: Draws a blue rectangle at (384, 119) with width 29 and height 89.
; PLAN: r0=384(x), r1=119(y), r2=29(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 119
LDI r2, 29
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
