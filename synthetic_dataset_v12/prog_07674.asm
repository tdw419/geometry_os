; DESCRIPTION: Places a purple line segment connecting (253, 77) to (445, 101).
; PLAN: r0=253(x1), r1=77(y1), r2=445(x2), r3=101(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 77
LDI r2, 445
LDI r3, 101
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
