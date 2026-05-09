; DESCRIPTION: Places a purple line segment connecting (104, 175) to (11, 7).
; PLAN: r0=104(x1), r1=175(y1), r2=11(x2), r3=7(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 175
LDI r2, 11
LDI r3, 7
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
