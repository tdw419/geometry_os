; DESCRIPTION: Places a yellow line segment connecting (97, 142) to (49, 141).
; PLAN: r0=97(x1), r1=142(y1), r2=49(x2), r3=141(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 142
LDI r2, 49
LDI r3, 141
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
