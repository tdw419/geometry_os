; DESCRIPTION: Draws a blue rectangle at (149, 200) with width 85 and height 14.
; PLAN: r0=149(x), r1=200(y), r2=85(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 200
LDI r2, 85
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
