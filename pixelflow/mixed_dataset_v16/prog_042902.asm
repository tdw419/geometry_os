; DESCRIPTION: Draws a orange line from (336, 90) to (100, 20).
; PLAN: r0=336(x1), r1=90(y1), r2=100(x2), r3=20(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 90
LDI r2, 100
LDI r3, 20
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
