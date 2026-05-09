; DESCRIPTION: Draws a orange line from (299, 199) to (189, 200).
; PLAN: r0=299(x1), r1=199(y1), r2=189(x2), r3=200(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 199
LDI r2, 189
LDI r3, 200
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
