; DESCRIPTION: Places a purple line segment connecting (449, 74) to (382, 112).
; PLAN: r0=449(x1), r1=74(y1), r2=382(x2), r3=112(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 74
LDI r2, 382
LDI r3, 112
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
