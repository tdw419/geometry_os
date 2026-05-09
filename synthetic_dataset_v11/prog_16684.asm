; DESCRIPTION: Draws a orange line from (77, 148) to (205, 15).
; PLAN: r0=77(x1), r1=148(y1), r2=205(x2), r3=15(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 148
LDI r2, 205
LDI r3, 15
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
