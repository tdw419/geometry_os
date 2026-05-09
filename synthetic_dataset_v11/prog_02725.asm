; DESCRIPTION: Places a purple line segment connecting (14, 104) to (120, 43).
; PLAN: r0=14(x1), r1=104(y1), r2=120(x2), r3=43(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 104
LDI r2, 120
LDI r3, 43
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
