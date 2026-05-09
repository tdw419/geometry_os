; DESCRIPTION: Draws a orange line from (199, 17) to (148, 161).
; PLAN: r0=199(x1), r1=17(y1), r2=148(x2), r3=161(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 17
LDI r2, 148
LDI r3, 161
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
