; DESCRIPTION: Renders a red line between points (266, 174) and (232, 102).
; PLAN: r0=266(x1), r1=174(y1), r2=232(x2), r3=102(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 174
LDI r2, 232
LDI r3, 102
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
