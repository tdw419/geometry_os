; DESCRIPTION: Composite: . Then Places a yellow line segment connecting (64, 130) to (201, 137). Then Places a orange dot at position (9, 149).
; PLAN: r0=64(x1), r1=130(y1), r2=201(x2), r3=137(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=9(x), r1=149(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a yellow line segment connecting (64, 130) to (201, 137).
; PLAN: r0=64(x1), r1=130(y1), r2=201(x2), r3=137(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 130
LDI r2, 201
LDI r3, 137
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange dot at position (9, 149).
; PLAN: r0=9(x), r1=149(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 9
LDI r1, 149
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
