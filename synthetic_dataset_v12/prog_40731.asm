; DESCRIPTION: Places a purple line segment connecting (495, 3) to (103, 78).
; PLAN: r0=495(x1), r1=3(y1), r2=103(x2), r3=78(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 3
LDI r2, 103
LDI r3, 78
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
