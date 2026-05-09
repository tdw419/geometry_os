; DESCRIPTION: Draws a orange line from (112, 118) to (382, 72).
; PLAN: r0=112(x1), r1=118(y1), r2=382(x2), r3=72(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 118
LDI r2, 382
LDI r3, 72
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
