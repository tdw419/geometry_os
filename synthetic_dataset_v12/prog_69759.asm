; DESCRIPTION: Places a purple line segment connecting (278, 140) to (48, 123).
; PLAN: r0=278(x1), r1=140(y1), r2=48(x2), r3=123(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 140
LDI r2, 48
LDI r3, 123
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
