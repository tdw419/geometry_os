; DESCRIPTION: Places a purple line segment connecting (87, 20) to (17, 48).
; PLAN: r0=87(x1), r1=20(y1), r2=17(x2), r3=48(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 20
LDI r2, 17
LDI r3, 48
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
