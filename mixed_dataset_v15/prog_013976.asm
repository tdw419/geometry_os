; DESCRIPTION: Renders a red line between points (117, 51) and (300, 155).
; PLAN: r0=117(x1), r1=51(y1), r2=300(x2), r3=155(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 51
LDI r2, 300
LDI r3, 155
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
