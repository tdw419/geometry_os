; DESCRIPTION: Draws a orange line from (467, 52) to (506, 18).
; PLAN: r0=467(x1), r1=52(y1), r2=506(x2), r3=18(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 52
LDI r2, 506
LDI r3, 18
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
