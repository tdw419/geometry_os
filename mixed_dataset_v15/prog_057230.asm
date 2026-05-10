; DESCRIPTION: Draws a orange line from (51, 75) to (382, 77).
; PLAN: r0=51(x1), r1=75(y1), r2=382(x2), r3=77(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 75
LDI r2, 382
LDI r3, 77
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
