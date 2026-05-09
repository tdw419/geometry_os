; DESCRIPTION: Renders a yellow line between points (24, 157) and (158, 185).
; PLAN: r0=24(x1), r1=157(y1), r2=158(x2), r3=185(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 157
LDI r2, 158
LDI r3, 185
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
