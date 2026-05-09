; DESCRIPTION: Renders a purple line between points (250, 95) and (101, 24).
; PLAN: r0=250(x1), r1=95(y1), r2=101(x2), r3=24(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 95
LDI r2, 101
LDI r3, 24
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
