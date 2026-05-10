; DESCRIPTION: Places a purple line segment connecting (66, 94) to (173, 49).
; PLAN: r0=66(x1), r1=94(y1), r2=173(x2), r3=49(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 94
LDI r2, 173
LDI r3, 49
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
