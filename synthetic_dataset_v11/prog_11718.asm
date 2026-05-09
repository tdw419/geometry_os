; DESCRIPTION: Composite: . Then Renders a yellow line between points (119, 108) and (201, 13). Then Sets a single red pixel at (4, 100).
; PLAN: r0=119(x1), r1=108(y1), r2=201(x2), r3=13(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=4(x), r1=100(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a yellow line between points (119, 108) and (201, 13).
; PLAN: r0=119(x1), r1=108(y1), r2=201(x2), r3=13(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 108
LDI r2, 201
LDI r3, 13
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single red pixel at (4, 100).
; PLAN: r0=4(x), r1=100(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 4
LDI r1, 100
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
