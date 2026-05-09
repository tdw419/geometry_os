; DESCRIPTION: Places a orange line segment connecting (52, 190) to (376, 249).
; PLAN: r0=52(x1), r1=190(y1), r2=376(x2), r3=249(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 190
LDI r2, 376
LDI r3, 249
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
