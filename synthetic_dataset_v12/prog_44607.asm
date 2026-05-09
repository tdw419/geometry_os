; DESCRIPTION: Places a purple line segment connecting (55, 168) to (310, 118).
; PLAN: r0=55(x1), r1=168(y1), r2=310(x2), r3=118(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 168
LDI r2, 310
LDI r3, 118
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
