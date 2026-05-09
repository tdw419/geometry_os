; DESCRIPTION: Places a red line segment connecting (190, 156) to (276, 84).
; PLAN: r0=190(x1), r1=156(y1), r2=276(x2), r3=84(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 156
LDI r2, 276
LDI r3, 84
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
