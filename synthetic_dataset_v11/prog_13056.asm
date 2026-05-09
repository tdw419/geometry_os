; DESCRIPTION: Composite: . Then Draws a orange line from (254, 199) to (101, 219). Then Renders a orange disk with center (156, 50) and radius 14.
; PLAN: r0=254(x1), r1=199(y1), r2=101(x2), r3=219(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=156(x), r1=50(y), r2=14(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a orange line from (254, 199) to (101, 219).
; PLAN: r0=254(x1), r1=199(y1), r2=101(x2), r3=219(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 199
LDI r2, 101
LDI r3, 219
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a orange disk with center (156, 50) and radius 14.
; PLAN: r0=156(x), r1=50(y), r2=14(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 50
LDI r2, 14
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
