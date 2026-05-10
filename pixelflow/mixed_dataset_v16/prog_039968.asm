; DESCRIPTION: Places a purple line segment connecting (111, 164) to (423, 250).
; PLAN: r0=111(x1), r1=164(y1), r2=423(x2), r3=250(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 164
LDI r2, 423
LDI r3, 250
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
