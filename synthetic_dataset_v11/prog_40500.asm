; DESCRIPTION: Renders a purple line between points (194, 195) and (178, 230).
; PLAN: r0=194(x1), r1=195(y1), r2=178(x2), r3=230(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 195
LDI r2, 178
LDI r3, 230
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
