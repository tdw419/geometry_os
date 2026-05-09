; DESCRIPTION: Draws a orange line from (151, 167) to (51, 253).
; PLAN: r0=151(x1), r1=167(y1), r2=51(x2), r3=253(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 167
LDI r2, 51
LDI r3, 253
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
