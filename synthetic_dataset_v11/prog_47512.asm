; DESCRIPTION: Renders a purple line between points (238, 195) and (216, 67).
; PLAN: r0=238(x1), r1=195(y1), r2=216(x2), r3=67(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 195
LDI r2, 216
LDI r3, 67
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
