; DESCRIPTION: Renders a orange line between points (349, 51) and (487, 252).
; PLAN: r0=349(x1), r1=51(y1), r2=487(x2), r3=252(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 51
LDI r2, 487
LDI r3, 252
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
