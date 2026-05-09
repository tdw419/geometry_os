; DESCRIPTION: Renders a orange line between points (471, 51) and (89, 51).
; PLAN: r0=471(x1), r1=51(y1), r2=89(x2), r3=51(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 51
LDI r2, 89
LDI r3, 51
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
