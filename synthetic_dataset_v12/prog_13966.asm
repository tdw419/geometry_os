; DESCRIPTION: Draws a orange line from (474, 238) to (83, 52).
; PLAN: r0=474(x1), r1=238(y1), r2=83(x2), r3=52(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 238
LDI r2, 83
LDI r3, 52
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
