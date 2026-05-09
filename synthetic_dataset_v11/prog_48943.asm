; DESCRIPTION: Composite: . Then Renders a blue line between points (145, 41) and (254, 108). Then Draws a green circle centered at (163, 200) with radius 33.
; PLAN: r0=145(x1), r1=41(y1), r2=254(x2), r3=108(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=163(x), r1=200(y), r2=33(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a blue line between points (145, 41) and (254, 108).
; PLAN: r0=145(x1), r1=41(y1), r2=254(x2), r3=108(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 41
LDI r2, 254
LDI r3, 108
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a green circle centered at (163, 200) with radius 33.
; PLAN: r0=163(x), r1=200(y), r2=33(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 163
LDI r1, 200
LDI r2, 33
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
