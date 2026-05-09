; DESCRIPTION: Places a blue line segment connecting (7, 167) to (31, 190).
; PLAN: r0=7(x1), r1=167(y1), r2=31(x2), r3=190(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 167
LDI r2, 31
LDI r3, 190
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
