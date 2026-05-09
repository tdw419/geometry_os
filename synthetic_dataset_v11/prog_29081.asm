; DESCRIPTION: Composite: . Then Renders a purple line between points (201, 61) and (9, 221). Then Places a yellow dot at position (61, 233).
; PLAN: r0=201(x1), r1=61(y1), r2=9(x2), r3=221(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=61(x), r1=233(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a purple line between points (201, 61) and (9, 221).
; PLAN: r0=201(x1), r1=61(y1), r2=9(x2), r3=221(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 61
LDI r2, 9
LDI r3, 221
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow dot at position (61, 233).
; PLAN: r0=61(x), r1=233(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 61
LDI r1, 233
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
