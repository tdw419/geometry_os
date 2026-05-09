; DESCRIPTION: Places a purple line segment connecting (110, 222) to (247, 197).
; PLAN: r0=110(x1), r1=222(y1), r2=247(x2), r3=197(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 222
LDI r2, 247
LDI r3, 197
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
