; DESCRIPTION: Renders a yellow line between points (374, 108) and (257, 201).
; PLAN: r0=374(x1), r1=108(y1), r2=257(x2), r3=201(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 108
LDI r2, 257
LDI r3, 201
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
