; DESCRIPTION: Renders a purple line between points (96, 100) and (60, 194).
; PLAN: r0=96(x1), r1=100(y1), r2=60(x2), r3=194(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 100
LDI r2, 60
LDI r3, 194
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
