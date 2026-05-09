; DESCRIPTION: Places a purple line segment connecting (282, 15) to (240, 181).
; PLAN: r0=282(x1), r1=15(y1), r2=240(x2), r3=181(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 15
LDI r2, 240
LDI r3, 181
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
