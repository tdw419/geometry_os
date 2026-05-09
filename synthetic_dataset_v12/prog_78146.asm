; DESCRIPTION: Places a purple line segment connecting (18, 175) to (397, 47).
; PLAN: r0=18(x1), r1=175(y1), r2=397(x2), r3=47(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 175
LDI r2, 397
LDI r3, 47
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
