; DESCRIPTION: Draws a orange line from (343, 164) to (377, 142).
; PLAN: r0=343(x1), r1=164(y1), r2=377(x2), r3=142(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 164
LDI r2, 377
LDI r3, 142
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
