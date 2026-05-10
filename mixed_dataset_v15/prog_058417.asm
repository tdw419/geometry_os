; DESCRIPTION: Renders a white line between points (110, 69) and (457, 201).
; PLAN: r0=110(x1), r1=69(y1), r2=457(x2), r3=201(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 69
LDI r2, 457
LDI r3, 201
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
