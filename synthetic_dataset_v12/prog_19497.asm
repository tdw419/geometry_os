; DESCRIPTION: Renders a yellow line between points (328, 110) and (221, 10).
; PLAN: r0=328(x1), r1=110(y1), r2=221(x2), r3=10(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 110
LDI r2, 221
LDI r3, 10
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
