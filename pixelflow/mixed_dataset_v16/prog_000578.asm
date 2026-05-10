; DESCRIPTION: Places a red line segment connecting (458, 80) to (144, 190).
; PLAN: r0=458(x1), r1=80(y1), r2=144(x2), r3=190(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 80
LDI r2, 144
LDI r3, 190
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
