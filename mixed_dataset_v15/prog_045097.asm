; DESCRIPTION: Renders a orange line between points (51, 199) and (262, 49).
; PLAN: r0=51(x1), r1=199(y1), r2=262(x2), r3=49(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 199
LDI r2, 262
LDI r3, 49
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
