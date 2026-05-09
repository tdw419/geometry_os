; DESCRIPTION: Composite: . Then Renders a blue line between points (47, 47) and (172, 102). Then Draws a orange rectangle at (13, 110) with width 76 and height 89.
; PLAN: r0=47(x1), r1=47(y1), r2=172(x2), r3=102(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=13(x), r1=110(y), r2=76(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a blue line between points (47, 47) and (172, 102).
; PLAN: r0=47(x1), r1=47(y1), r2=172(x2), r3=102(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 47
LDI r2, 172
LDI r3, 102
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a orange rectangle at (13, 110) with width 76 and height 89.
; PLAN: r0=13(x), r1=110(y), r2=76(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 110
LDI r2, 76
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
