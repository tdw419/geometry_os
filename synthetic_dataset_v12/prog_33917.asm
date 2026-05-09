; DESCRIPTION: Places a purple line segment connecting (265, 194) to (457, 83).
; PLAN: r0=265(x1), r1=194(y1), r2=457(x2), r3=83(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 194
LDI r2, 457
LDI r3, 83
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
