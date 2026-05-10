; DESCRIPTION: Places a purple line segment connecting (154, 124) to (278, 20).
; PLAN: r0=154(x1), r1=124(y1), r2=278(x2), r3=20(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 124
LDI r2, 278
LDI r3, 20
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
