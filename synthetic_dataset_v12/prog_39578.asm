; DESCRIPTION: Renders a purple line between points (18, 133) and (76, 15).
; PLAN: r0=18(x1), r1=133(y1), r2=76(x2), r3=15(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 133
LDI r2, 76
LDI r3, 15
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
