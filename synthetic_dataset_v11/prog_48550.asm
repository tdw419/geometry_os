; DESCRIPTION: Renders a purple line between points (214, 135) and (162, 90).
; PLAN: r0=214(x1), r1=135(y1), r2=162(x2), r3=90(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 135
LDI r2, 162
LDI r3, 90
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
