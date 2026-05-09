; DESCRIPTION: Composite: . Then Places a orange line segment connecting (211, 245) to (26, 52). Then Draws a purple circle centered at (63, 96) with radius 51.
; PLAN: r0=211(x1), r1=245(y1), r2=26(x2), r3=52(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=63(x), r1=96(y), r2=51(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a orange line segment connecting (211, 245) to (26, 52).
; PLAN: r0=211(x1), r1=245(y1), r2=26(x2), r3=52(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 245
LDI r2, 26
LDI r3, 52
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a purple circle centered at (63, 96) with radius 51.
; PLAN: r0=63(x), r1=96(y), r2=51(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 63
LDI r1, 96
LDI r2, 51
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
