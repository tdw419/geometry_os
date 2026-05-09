; DESCRIPTION: Places a red line segment connecting (449, 244) to (266, 190).
; PLAN: r0=449(x1), r1=244(y1), r2=266(x2), r3=190(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 244
LDI r2, 266
LDI r3, 190
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
