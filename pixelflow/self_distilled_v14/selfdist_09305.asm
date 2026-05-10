; DESCRIPTION: Draws a blue rectangle at (55, 119) with width 85 and height 24.
; PLAN: r0=55(x), r1=119(y), r2=85(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 119
LDI r2, 85
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
