; DESCRIPTION: Places a purple line segment connecting (57, 218) to (130, 166).
; PLAN: r0=57(x1), r1=218(y1), r2=130(x2), r3=166(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 218
LDI r2, 130
LDI r3, 166
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
