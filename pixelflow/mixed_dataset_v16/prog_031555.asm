; DESCRIPTION: Places a purple line segment connecting (217, 144) to (138, 31).
; PLAN: r0=217(x1), r1=144(y1), r2=138(x2), r3=31(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 144
LDI r2, 138
LDI r3, 31
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
