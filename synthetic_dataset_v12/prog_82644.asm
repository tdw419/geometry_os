; DESCRIPTION: Places a purple line segment connecting (493, 182) to (39, 141).
; PLAN: r0=493(x1), r1=182(y1), r2=39(x2), r3=141(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 182
LDI r2, 39
LDI r3, 141
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
