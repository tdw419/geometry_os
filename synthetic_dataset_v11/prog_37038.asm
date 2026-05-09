; DESCRIPTION: Places a purple line segment connecting (220, 171) to (49, 139).
; PLAN: r0=220(x1), r1=171(y1), r2=49(x2), r3=139(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 171
LDI r2, 49
LDI r3, 139
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
