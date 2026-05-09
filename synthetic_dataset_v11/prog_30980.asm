; DESCRIPTION: Places a purple line segment connecting (40, 175) to (199, 253).
; PLAN: r0=40(x1), r1=175(y1), r2=199(x2), r3=253(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 175
LDI r2, 199
LDI r3, 253
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
