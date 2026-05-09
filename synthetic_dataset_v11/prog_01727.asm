; DESCRIPTION: Draws a orange line from (200, 112) to (12, 160).
; PLAN: r0=200(x1), r1=112(y1), r2=12(x2), r3=160(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 112
LDI r2, 12
LDI r3, 160
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
