; DESCRIPTION: Composite: . Then Draws a blue rectangle at (159, 105) with width 20 and height 15. Then Places a purple line segment connecting (164, 29) to (12, 85).
; PLAN: r0=159(x), r1=105(y), r2=20(width), r3=15(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=164(x1), r1=29(y1), r2=12(x2), r3=85(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a blue rectangle at (159, 105) with width 20 and height 15.
; PLAN: r0=159(x), r1=105(y), r2=20(width), r3=15(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 105
LDI r2, 20
LDI r3, 15
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple line segment connecting (164, 29) to (12, 85).
; PLAN: r0=164(x1), r1=29(y1), r2=12(x2), r3=85(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 29
LDI r2, 12
LDI r3, 85
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
