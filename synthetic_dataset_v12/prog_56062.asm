; DESCRIPTION: Places a black line segment connecting (107, 233) to (451, 54).
; PLAN: r0=107(x1), r1=233(y1), r2=451(x2), r3=54(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 233
LDI r2, 451
LDI r3, 54
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
