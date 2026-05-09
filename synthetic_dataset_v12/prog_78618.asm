; DESCRIPTION: Renders a red line between points (314, 219) and (51, 24).
; PLAN: r0=314(x1), r1=219(y1), r2=51(x2), r3=24(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 219
LDI r2, 51
LDI r3, 24
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
