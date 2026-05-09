; DESCRIPTION: Places a purple line segment connecting (91, 113) to (356, 2).
; PLAN: r0=91(x1), r1=113(y1), r2=356(x2), r3=2(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 113
LDI r2, 356
LDI r3, 2
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
