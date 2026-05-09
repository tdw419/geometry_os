; DESCRIPTION: Draws a purple line from (119, 20) to (76, 57).
; PLAN: r0=119(x1), r1=20(y1), r2=76(x2), r3=57(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 20
LDI r2, 76
LDI r3, 57
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
