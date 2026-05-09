; DESCRIPTION: Draws a orange line from (294, 25) to (348, 66).
; PLAN: r0=294(x1), r1=25(y1), r2=348(x2), r3=66(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 25
LDI r2, 348
LDI r3, 66
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
