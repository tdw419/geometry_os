; DESCRIPTION: Places a purple line segment connecting (132, 237) to (172, 18).
; PLAN: r0=132(x1), r1=237(y1), r2=172(x2), r3=18(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 237
LDI r2, 172
LDI r3, 18
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
