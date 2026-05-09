; DESCRIPTION: Renders a green line between points (318, 89) and (95, 13).
; PLAN: r0=318(x1), r1=89(y1), r2=95(x2), r3=13(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 89
LDI r2, 95
LDI r3, 13
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
