; DESCRIPTION: Renders a purple line between points (125, 158) and (82, 32).
; PLAN: r0=125(x1), r1=158(y1), r2=82(x2), r3=32(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 158
LDI r2, 82
LDI r3, 32
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
