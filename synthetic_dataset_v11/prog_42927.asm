; DESCRIPTION: Places a purple line segment connecting (25, 5) to (226, 15).
; PLAN: r0=25(x1), r1=5(y1), r2=226(x2), r3=15(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 5
LDI r2, 226
LDI r3, 15
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
