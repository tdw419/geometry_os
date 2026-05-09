; DESCRIPTION: Draws a orange line from (314, 30) to (426, 64).
; PLAN: r0=314(x1), r1=30(y1), r2=426(x2), r3=64(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 30
LDI r2, 426
LDI r3, 64
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
