; DESCRIPTION: Renders a yellow line between points (90, 58) and (119, 105).
; PLAN: r0=90(x1), r1=58(y1), r2=119(x2), r3=105(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 58
LDI r2, 119
LDI r3, 105
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
