; DESCRIPTION: Renders a magenta line between points (508, 137) and (34, 33).
; PLAN: r0=508(x1), r1=137(y1), r2=34(x2), r3=33(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 137
LDI r2, 34
LDI r3, 33
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
