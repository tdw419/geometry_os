; DESCRIPTION: Renders a purple line between points (370, 238) and (377, 141).
; PLAN: r0=370(x1), r1=238(y1), r2=377(x2), r3=141(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 238
LDI r2, 377
LDI r3, 141
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
