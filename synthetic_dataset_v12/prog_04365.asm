; DESCRIPTION: Places a purple line segment connecting (45, 200) to (88, 215).
; PLAN: r0=45(x1), r1=200(y1), r2=88(x2), r3=215(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 200
LDI r2, 88
LDI r3, 215
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
