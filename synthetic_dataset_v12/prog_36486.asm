; DESCRIPTION: Places a yellow line segment connecting (432, 206) to (105, 77).
; PLAN: r0=432(x1), r1=206(y1), r2=105(x2), r3=77(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 206
LDI r2, 105
LDI r3, 77
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
