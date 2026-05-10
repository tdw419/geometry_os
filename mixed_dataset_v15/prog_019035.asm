; DESCRIPTION: Renders a green line between points (66, 89) and (85, 73).
; PLAN: r0=66(x1), r1=89(y1), r2=85(x2), r3=73(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 89
LDI r2, 85
LDI r3, 73
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
