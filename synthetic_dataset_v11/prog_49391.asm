; DESCRIPTION: Renders a green line between points (88, 31) and (232, 110).
; PLAN: r0=88(x1), r1=31(y1), r2=232(x2), r3=110(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 31
LDI r2, 232
LDI r3, 110
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
