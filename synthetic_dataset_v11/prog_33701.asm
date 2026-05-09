; DESCRIPTION: Renders a purple line between points (81, 37) and (47, 202).
; PLAN: r0=81(x1), r1=37(y1), r2=47(x2), r3=202(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 37
LDI r2, 47
LDI r3, 202
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
