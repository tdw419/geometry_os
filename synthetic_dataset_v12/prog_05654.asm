; DESCRIPTION: Draws a orange line from (431, 172) to (365, 78).
; PLAN: r0=431(x1), r1=172(y1), r2=365(x2), r3=78(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 172
LDI r2, 365
LDI r3, 78
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
