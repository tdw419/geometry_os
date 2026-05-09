; DESCRIPTION: Renders a red line between points (288, 243) and (51, 58).
; PLAN: r0=288(x1), r1=243(y1), r2=51(x2), r3=58(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 243
LDI r2, 51
LDI r3, 58
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
