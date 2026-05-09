; DESCRIPTION: Draws a blue rectangle at (0, 58) with width 110 and height 89.
; PLAN: r0=0(x), r1=58(y), r2=110(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 58
LDI r2, 110
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
