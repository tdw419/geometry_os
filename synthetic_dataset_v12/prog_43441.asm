; DESCRIPTION: Places a red line segment connecting (190, 80) to (426, 172).
; PLAN: r0=190(x1), r1=80(y1), r2=426(x2), r3=172(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 80
LDI r2, 426
LDI r3, 172
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
