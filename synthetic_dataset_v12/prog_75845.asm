; DESCRIPTION: Renders a red line between points (311, 212) and (497, 184).
; PLAN: r0=311(x1), r1=212(y1), r2=497(x2), r3=184(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 212
LDI r2, 497
LDI r3, 184
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
