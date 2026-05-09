; DESCRIPTION: Renders a white line between points (292, 186) and (93, 217).
; PLAN: r0=292(x1), r1=186(y1), r2=93(x2), r3=217(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 186
LDI r2, 93
LDI r3, 217
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
