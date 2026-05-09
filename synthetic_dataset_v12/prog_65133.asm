; DESCRIPTION: Draws a orange line from (506, 57) to (119, 14).
; PLAN: r0=506(x1), r1=57(y1), r2=119(x2), r3=14(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 57
LDI r2, 119
LDI r3, 14
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
