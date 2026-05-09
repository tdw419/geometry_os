; DESCRIPTION: Renders a purple line between points (334, 93) and (292, 28).
; PLAN: r0=334(x1), r1=93(y1), r2=292(x2), r3=28(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 93
LDI r2, 292
LDI r3, 28
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
