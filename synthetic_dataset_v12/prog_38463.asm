; DESCRIPTION: Renders a yellow line between points (100, 36) and (211, 75).
; PLAN: r0=100(x1), r1=36(y1), r2=211(x2), r3=75(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 36
LDI r2, 211
LDI r3, 75
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
