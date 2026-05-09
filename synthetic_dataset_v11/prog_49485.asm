; DESCRIPTION: Places a purple line segment connecting (233, 183) to (151, 222).
; PLAN: r0=233(x1), r1=183(y1), r2=151(x2), r3=222(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 183
LDI r2, 151
LDI r3, 222
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
