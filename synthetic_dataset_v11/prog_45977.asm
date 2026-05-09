; DESCRIPTION: Draws a orange line from (2, 89) to (241, 253).
; PLAN: r0=2(x1), r1=89(y1), r2=241(x2), r3=253(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 89
LDI r2, 241
LDI r3, 253
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
