; DESCRIPTION: Draws a orange line from (99, 189) to (191, 112).
; PLAN: r0=99(x1), r1=189(y1), r2=191(x2), r3=112(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 189
LDI r2, 191
LDI r3, 112
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
