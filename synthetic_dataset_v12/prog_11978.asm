; DESCRIPTION: Renders a purple line between points (156, 121) and (47, 178).
; PLAN: r0=156(x1), r1=121(y1), r2=47(x2), r3=178(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 121
LDI r2, 47
LDI r3, 178
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
