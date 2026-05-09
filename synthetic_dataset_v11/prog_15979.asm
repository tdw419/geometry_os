; DESCRIPTION: Composite: . Then Draws a magenta line from (87, 201) to (52, 73). Then Creates a black circular shape at (108, 85) with radius 22.
; PLAN: r0=87(x1), r1=201(y1), r2=52(x2), r3=73(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=108(x), r1=85(y), r2=22(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a magenta line from (87, 201) to (52, 73).
; PLAN: r0=87(x1), r1=201(y1), r2=52(x2), r3=73(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 201
LDI r2, 52
LDI r3, 73
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a black circular shape at (108, 85) with radius 22.
; PLAN: r0=108(x), r1=85(y), r2=22(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 85
LDI r2, 22
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
