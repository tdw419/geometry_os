; DESCRIPTION: Draws a magenta line from (348, 170) to (96, 245).
; PLAN: r0=348(x1), r1=170(y1), r2=96(x2), r3=245(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 170
LDI r2, 96
LDI r3, 245
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
