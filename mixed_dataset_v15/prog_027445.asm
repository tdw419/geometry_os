; DESCRIPTION: Renders a red line between points (33, 89) and (219, 15).
; PLAN: r0=33(x1), r1=89(y1), r2=219(x2), r3=15(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 89
LDI r2, 219
LDI r3, 15
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
