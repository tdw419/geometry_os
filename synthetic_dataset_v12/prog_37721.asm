; DESCRIPTION: Renders a orange line between points (347, 131) and (125, 82).
; PLAN: r0=347(x1), r1=131(y1), r2=125(x2), r3=82(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 131
LDI r2, 125
LDI r3, 82
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
