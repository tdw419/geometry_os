; DESCRIPTION: Renders a white line between points (312, 22) and (179, 89).
; PLAN: r0=312(x1), r1=22(y1), r2=179(x2), r3=89(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 22
LDI r2, 179
LDI r3, 89
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
