; DESCRIPTION: Renders a green line between points (89, 23) and (252, 7).
; PLAN: r0=89(x1), r1=23(y1), r2=252(x2), r3=7(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 23
LDI r2, 252
LDI r3, 7
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
