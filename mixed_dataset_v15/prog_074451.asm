; DESCRIPTION: Renders a magenta line between points (332, 193) and (78, 201).
; PLAN: r0=332(x1), r1=193(y1), r2=78(x2), r3=201(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 193
LDI r2, 78
LDI r3, 201
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
