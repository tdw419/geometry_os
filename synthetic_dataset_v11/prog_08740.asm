; DESCRIPTION: Renders a purple line between points (252, 47) and (241, 93).
; PLAN: r0=252(x1), r1=47(y1), r2=241(x2), r3=93(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 47
LDI r2, 241
LDI r3, 93
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
