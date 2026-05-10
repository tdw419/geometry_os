; DESCRIPTION: Renders a purple line between points (58, 231) and (471, 25).
; PLAN: r0=58(x1), r1=231(y1), r2=471(x2), r3=25(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 231
LDI r2, 471
LDI r3, 25
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
