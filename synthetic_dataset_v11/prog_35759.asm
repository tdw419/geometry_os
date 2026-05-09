; DESCRIPTION: Places a purple line segment connecting (154, 170) to (217, 115).
; PLAN: r0=154(x1), r1=170(y1), r2=217(x2), r3=115(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 170
LDI r2, 217
LDI r3, 115
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
