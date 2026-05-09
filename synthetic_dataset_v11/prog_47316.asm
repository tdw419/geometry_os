; DESCRIPTION: Draws a orange line from (60, 112) to (102, 21).
; PLAN: r0=60(x1), r1=112(y1), r2=102(x2), r3=21(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 112
LDI r2, 102
LDI r3, 21
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
