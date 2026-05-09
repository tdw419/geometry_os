; DESCRIPTION: Renders a purple line between points (302, 30) and (143, 67).
; PLAN: r0=302(x1), r1=30(y1), r2=143(x2), r3=67(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 30
LDI r2, 143
LDI r3, 67
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
