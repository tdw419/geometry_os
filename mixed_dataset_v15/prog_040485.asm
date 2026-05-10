; DESCRIPTION: Places a yellow line segment connecting (378, 7) to (444, 0).
; PLAN: r0=378(x1), r1=7(y1), r2=444(x2), r3=0(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 7
LDI r2, 444
LDI r3, 0
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
