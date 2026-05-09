; DESCRIPTION: Renders a purple line between points (28, 116) and (292, 32).
; PLAN: r0=28(x1), r1=116(y1), r2=292(x2), r3=32(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 116
LDI r2, 292
LDI r3, 32
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
