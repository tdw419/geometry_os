; DESCRIPTION: Places a yellow line segment connecting (78, 188) to (116, 77).
; PLAN: r0=78(x1), r1=188(y1), r2=116(x2), r3=77(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 188
LDI r2, 116
LDI r3, 77
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
