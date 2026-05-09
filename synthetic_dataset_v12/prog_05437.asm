; DESCRIPTION: Renders a purple line between points (29, 85) and (116, 178).
; PLAN: r0=29(x1), r1=85(y1), r2=116(x2), r3=178(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 85
LDI r2, 116
LDI r3, 178
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
