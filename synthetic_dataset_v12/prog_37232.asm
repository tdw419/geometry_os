; DESCRIPTION: Renders a purple line between points (370, 53) and (38, 238).
; PLAN: r0=370(x1), r1=53(y1), r2=38(x2), r3=238(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 53
LDI r2, 38
LDI r3, 238
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
