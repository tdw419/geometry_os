; DESCRIPTION: Draws a blue rectangle at (89, 187) with width 35 and height 14.
; PLAN: r0=89(x), r1=187(y), r2=35(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 187
LDI r2, 35
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
