; DESCRIPTION: Draws a orange line from (293, 72) to (115, 106).
; PLAN: r0=293(x1), r1=72(y1), r2=115(x2), r3=106(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 72
LDI r2, 115
LDI r3, 106
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
