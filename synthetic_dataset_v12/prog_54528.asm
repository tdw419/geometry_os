; DESCRIPTION: Renders a purple line between points (67, 60) and (306, 94).
; PLAN: r0=67(x1), r1=60(y1), r2=306(x2), r3=94(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 60
LDI r2, 306
LDI r3, 94
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
