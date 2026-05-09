; DESCRIPTION: Renders a purple line between points (57, 226) and (105, 230).
; PLAN: r0=57(x1), r1=226(y1), r2=105(x2), r3=230(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 226
LDI r2, 105
LDI r3, 230
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
