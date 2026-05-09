; DESCRIPTION: Renders a purple line between points (43, 231) and (19, 238).
; PLAN: r0=43(x1), r1=231(y1), r2=19(x2), r3=238(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 231
LDI r2, 19
LDI r3, 238
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
