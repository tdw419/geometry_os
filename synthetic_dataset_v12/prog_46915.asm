; DESCRIPTION: Renders a black line between points (183, 201) and (227, 175).
; PLAN: r0=183(x1), r1=201(y1), r2=227(x2), r3=175(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 201
LDI r2, 227
LDI r3, 175
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
