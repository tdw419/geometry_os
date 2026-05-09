; DESCRIPTION: Renders a yellow line between points (484, 106) and (127, 112).
; PLAN: r0=484(x1), r1=106(y1), r2=127(x2), r3=112(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 106
LDI r2, 127
LDI r3, 112
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
