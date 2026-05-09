; DESCRIPTION: Renders a purple line between points (222, 0) and (216, 95).
; PLAN: r0=222(x1), r1=0(y1), r2=216(x2), r3=95(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 0
LDI r2, 216
LDI r3, 95
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
