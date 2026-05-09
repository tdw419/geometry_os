; DESCRIPTION: Places a purple line segment connecting (73, 173) to (8, 17).
; PLAN: r0=73(x1), r1=173(y1), r2=8(x2), r3=17(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 173
LDI r2, 8
LDI r3, 17
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
