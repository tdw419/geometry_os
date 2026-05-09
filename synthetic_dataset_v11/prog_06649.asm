; DESCRIPTION: Renders a blue line between points (211, 101) and (179, 66).
; PLAN: r0=211(x1), r1=101(y1), r2=179(x2), r3=66(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 101
LDI r2, 179
LDI r3, 66
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
