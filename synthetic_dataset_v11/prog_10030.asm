; DESCRIPTION: Renders a red line between points (51, 99) and (88, 71).
; PLAN: r0=51(x1), r1=99(y1), r2=88(x2), r3=71(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 99
LDI r2, 88
LDI r3, 71
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
