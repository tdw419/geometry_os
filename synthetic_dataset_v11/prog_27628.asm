; DESCRIPTION: Renders a purple line between points (96, 53) and (1, 109).
; PLAN: r0=96(x1), r1=53(y1), r2=1(x2), r3=109(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 53
LDI r2, 1
LDI r3, 109
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
