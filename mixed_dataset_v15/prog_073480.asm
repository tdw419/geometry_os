; DESCRIPTION: Renders a red line between points (273, 17) and (51, 178).
; PLAN: r0=273(x1), r1=17(y1), r2=51(x2), r3=178(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 17
LDI r2, 51
LDI r3, 178
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
