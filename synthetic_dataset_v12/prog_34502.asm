; DESCRIPTION: Draws a orange line from (145, 51) to (133, 146).
; PLAN: r0=145(x1), r1=51(y1), r2=133(x2), r3=146(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 51
LDI r2, 133
LDI r3, 146
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
