; DESCRIPTION: Places a red line segment connecting (431, 247) to (271, 190).
; PLAN: r0=431(x1), r1=247(y1), r2=271(x2), r3=190(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 247
LDI r2, 271
LDI r3, 190
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
