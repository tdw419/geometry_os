; DESCRIPTION: Places a purple line segment connecting (244, 111) to (345, 114).
; PLAN: r0=244(x1), r1=111(y1), r2=345(x2), r3=114(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 111
LDI r2, 345
LDI r3, 114
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
