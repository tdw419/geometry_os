; DESCRIPTION: Draws a green line from (102, 136) to (83, 201).
; PLAN: r0=102(x1), r1=136(y1), r2=83(x2), r3=201(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 136
LDI r2, 83
LDI r3, 201
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
