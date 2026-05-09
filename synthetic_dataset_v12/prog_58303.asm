; DESCRIPTION: Places a purple line segment connecting (37, 98) to (53, 71).
; PLAN: r0=37(x1), r1=98(y1), r2=53(x2), r3=71(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 98
LDI r2, 53
LDI r3, 71
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
