; DESCRIPTION: Places a red line segment connecting (47, 219) to (192, 118).
; PLAN: r0=47(x1), r1=219(y1), r2=192(x2), r3=118(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 219
LDI r2, 192
LDI r3, 118
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
