; DESCRIPTION: Places a purple line segment connecting (35, 61) to (86, 81).
; PLAN: r0=35(x1), r1=61(y1), r2=86(x2), r3=81(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 61
LDI r2, 86
LDI r3, 81
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
