; DESCRIPTION: Draws a orange line from (475, 151) to (336, 1).
; PLAN: r0=475(x1), r1=151(y1), r2=336(x2), r3=1(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 151
LDI r2, 336
LDI r3, 1
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
