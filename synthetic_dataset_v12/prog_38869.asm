; DESCRIPTION: Places a purple line segment connecting (119, 215) to (149, 71).
; PLAN: r0=119(x1), r1=215(y1), r2=149(x2), r3=71(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 215
LDI r2, 149
LDI r3, 71
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
