; DESCRIPTION: Renders a red line between points (311, 198) and (276, 124).
; PLAN: r0=311(x1), r1=198(y1), r2=276(x2), r3=124(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 198
LDI r2, 276
LDI r3, 124
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
