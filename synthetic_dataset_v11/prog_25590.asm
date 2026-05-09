; DESCRIPTION: Renders a red line between points (51, 162) and (178, 55).
; PLAN: r0=51(x1), r1=162(y1), r2=178(x2), r3=55(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 162
LDI r2, 178
LDI r3, 55
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
