; DESCRIPTION: Renders a purple line between points (157, 178) and (205, 230).
; PLAN: r0=157(x1), r1=178(y1), r2=205(x2), r3=230(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 178
LDI r2, 205
LDI r3, 230
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
