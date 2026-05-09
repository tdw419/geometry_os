; DESCRIPTION: Renders a purple line between points (158, 43) and (16, 156).
; PLAN: r0=158(x1), r1=43(y1), r2=16(x2), r3=156(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 43
LDI r2, 16
LDI r3, 156
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
