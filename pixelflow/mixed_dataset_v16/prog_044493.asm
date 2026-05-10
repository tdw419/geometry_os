; DESCRIPTION: Renders a red line between points (53, 251) and (80, 183).
; PLAN: r0=53(x1), r1=251(y1), r2=80(x2), r3=183(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 251
LDI r2, 80
LDI r3, 183
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
