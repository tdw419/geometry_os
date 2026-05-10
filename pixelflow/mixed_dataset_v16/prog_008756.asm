; DESCRIPTION: Places a red line segment connecting (361, 86) to (109, 89).
; PLAN: r0=361(x1), r1=86(y1), r2=109(x2), r3=89(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 86
LDI r2, 109
LDI r3, 89
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
