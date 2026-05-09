; DESCRIPTION: Places a red line segment connecting (111, 116) to (28, 190).
; PLAN: r0=111(x1), r1=116(y1), r2=28(x2), r3=190(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 116
LDI r2, 28
LDI r3, 190
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
