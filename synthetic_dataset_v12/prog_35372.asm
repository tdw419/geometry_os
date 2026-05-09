; DESCRIPTION: Places a yellow line segment connecting (3, 44) to (276, 22).
; PLAN: r0=3(x1), r1=44(y1), r2=276(x2), r3=22(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 44
LDI r2, 276
LDI r3, 22
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
