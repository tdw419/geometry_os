; DESCRIPTION: Renders a yellow line between points (95, 52) and (23, 211).
; PLAN: r0=95(x1), r1=52(y1), r2=23(x2), r3=211(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 52
LDI r2, 23
LDI r3, 211
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
