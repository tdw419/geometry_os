; DESCRIPTION: Draws a orange line from (11, 64) to (325, 99).
; PLAN: r0=11(x1), r1=64(y1), r2=325(x2), r3=99(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 64
LDI r2, 325
LDI r3, 99
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
