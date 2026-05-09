; DESCRIPTION: Renders a purple line between points (198, 109) and (153, 230).
; PLAN: r0=198(x1), r1=109(y1), r2=153(x2), r3=230(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 109
LDI r2, 153
LDI r3, 230
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
