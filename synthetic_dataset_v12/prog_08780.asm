; DESCRIPTION: Renders a purple line between points (99, 60) and (413, 93).
; PLAN: r0=99(x1), r1=60(y1), r2=413(x2), r3=93(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 60
LDI r2, 413
LDI r3, 93
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
