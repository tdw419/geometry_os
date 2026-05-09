; DESCRIPTION: Draws a white line from (7, 201) to (88, 245).
; PLAN: r0=7(x1), r1=201(y1), r2=88(x2), r3=245(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 201
LDI r2, 88
LDI r3, 245
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
