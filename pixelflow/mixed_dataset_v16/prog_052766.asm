; DESCRIPTION: Places a purple line segment connecting (418, 111) to (52, 151).
; PLAN: r0=418(x1), r1=111(y1), r2=52(x2), r3=151(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 111
LDI r2, 52
LDI r3, 151
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
