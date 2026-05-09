; DESCRIPTION: Renders a purple line between points (106, 0) and (82, 212).
; PLAN: r0=106(x1), r1=0(y1), r2=82(x2), r3=212(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 0
LDI r2, 82
LDI r3, 212
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
