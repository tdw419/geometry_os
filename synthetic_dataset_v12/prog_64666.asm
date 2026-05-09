; DESCRIPTION: Places a purple line segment connecting (486, 111) to (282, 238).
; PLAN: r0=486(x1), r1=111(y1), r2=282(x2), r3=238(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 111
LDI r2, 282
LDI r3, 238
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
