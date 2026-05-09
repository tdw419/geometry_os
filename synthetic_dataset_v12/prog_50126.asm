; DESCRIPTION: Places a white line segment connecting (451, 192) to (29, 66).
; PLAN: r0=451(x1), r1=192(y1), r2=29(x2), r3=66(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 192
LDI r2, 29
LDI r3, 66
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
