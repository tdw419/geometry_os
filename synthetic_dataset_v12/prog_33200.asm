; DESCRIPTION: Renders a white line between points (414, 45) and (495, 97).
; PLAN: r0=414(x1), r1=45(y1), r2=495(x2), r3=97(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 45
LDI r2, 495
LDI r3, 97
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
