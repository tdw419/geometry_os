; DESCRIPTION: Renders a red line between points (377, 248) and (105, 249).
; PLAN: r0=377(x1), r1=248(y1), r2=105(x2), r3=249(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 248
LDI r2, 105
LDI r3, 249
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
