; DESCRIPTION: Renders a red line between points (219, 81) and (232, 109).
; PLAN: r0=219(x1), r1=81(y1), r2=232(x2), r3=109(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 81
LDI r2, 232
LDI r3, 109
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
