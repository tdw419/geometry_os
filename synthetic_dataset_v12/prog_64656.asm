; DESCRIPTION: Renders a orange line between points (75, 51) and (287, 199).
; PLAN: r0=75(x1), r1=51(y1), r2=287(x2), r3=199(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 51
LDI r2, 287
LDI r3, 199
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
