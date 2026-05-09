; DESCRIPTION: Places a white line segment connecting (190, 101) to (7, 9).
; PLAN: r0=190(x1), r1=101(y1), r2=7(x2), r3=9(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 101
LDI r2, 7
LDI r3, 9
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
