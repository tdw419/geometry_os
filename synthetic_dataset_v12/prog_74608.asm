; DESCRIPTION: Places a green line segment connecting (395, 167) to (253, 77).
; PLAN: r0=395(x1), r1=167(y1), r2=253(x2), r3=77(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 167
LDI r2, 253
LDI r3, 77
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
