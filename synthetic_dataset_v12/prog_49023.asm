; DESCRIPTION: Places a yellow line segment connecting (107, 77) to (431, 36).
; PLAN: r0=107(x1), r1=77(y1), r2=431(x2), r3=36(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 77
LDI r2, 431
LDI r3, 36
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
