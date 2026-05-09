; DESCRIPTION: Renders a yellow line between points (35, 81) and (212, 22).
; PLAN: r0=35(x1), r1=81(y1), r2=212(x2), r3=22(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 81
LDI r2, 212
LDI r3, 22
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
