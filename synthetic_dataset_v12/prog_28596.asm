; DESCRIPTION: Draws a orange line from (461, 66) to (199, 224).
; PLAN: r0=461(x1), r1=66(y1), r2=199(x2), r3=224(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 66
LDI r2, 199
LDI r3, 224
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
