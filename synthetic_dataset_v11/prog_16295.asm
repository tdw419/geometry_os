; DESCRIPTION: Composite: . Then Places a orange line segment connecting (247, 84) to (176, 98). Then Draws a magenta circle centered at (89, 148) with radius 20.
; PLAN: r0=247(x1), r1=84(y1), r2=176(x2), r3=98(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=89(x), r1=148(y), r2=20(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a orange line segment connecting (247, 84) to (176, 98).
; PLAN: r0=247(x1), r1=84(y1), r2=176(x2), r3=98(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 84
LDI r2, 176
LDI r3, 98
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a magenta circle centered at (89, 148) with radius 20.
; PLAN: r0=89(x), r1=148(y), r2=20(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 89
LDI r1, 148
LDI r2, 20
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
