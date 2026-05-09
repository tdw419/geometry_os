; DESCRIPTION: Renders a purple line between points (12, 248) and (76, 162).
; PLAN: r0=12(x1), r1=248(y1), r2=76(x2), r3=162(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 248
LDI r2, 76
LDI r3, 162
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
