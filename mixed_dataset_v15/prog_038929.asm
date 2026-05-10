; DESCRIPTION: Renders a orange line between points (432, 51) and (82, 234).
; PLAN: r0=432(x1), r1=51(y1), r2=82(x2), r3=234(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 51
LDI r2, 82
LDI r3, 234
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
