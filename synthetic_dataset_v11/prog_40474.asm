; DESCRIPTION: Composite: . Then Places a orange line segment connecting (181, 200) to (194, 243). Then Draws a yellow rectangle at (29, 95) with width 93 and height 15.
; PLAN: r0=181(x1), r1=200(y1), r2=194(x2), r3=243(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=29(x), r1=95(y), r2=93(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange line segment connecting (181, 200) to (194, 243).
; PLAN: r0=181(x1), r1=200(y1), r2=194(x2), r3=243(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 200
LDI r2, 194
LDI r3, 243
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a yellow rectangle at (29, 95) with width 93 and height 15.
; PLAN: r0=29(x), r1=95(y), r2=93(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 95
LDI r2, 93
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
