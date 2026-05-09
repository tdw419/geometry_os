; DESCRIPTION: Places a purple line segment connecting (98, 37) to (71, 64).
; PLAN: r0=98(x1), r1=37(y1), r2=71(x2), r3=64(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 37
LDI r2, 71
LDI r3, 64
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
