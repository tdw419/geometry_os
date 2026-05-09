; DESCRIPTION: Places a purple line segment connecting (440, 17) to (67, 120).
; PLAN: r0=440(x1), r1=17(y1), r2=67(x2), r3=120(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 17
LDI r2, 67
LDI r3, 120
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
