; DESCRIPTION: Renders a white line between points (68, 201) and (23, 145).
; PLAN: r0=68(x1), r1=201(y1), r2=23(x2), r3=145(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 201
LDI r2, 23
LDI r3, 145
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
