; DESCRIPTION: Renders a magenta line between points (142, 211) and (252, 201).
; PLAN: r0=142(x1), r1=211(y1), r2=252(x2), r3=201(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 211
LDI r2, 252
LDI r3, 201
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
