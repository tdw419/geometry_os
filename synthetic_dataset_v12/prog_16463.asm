; DESCRIPTION: Renders a purple line between points (231, 100) and (503, 238).
; PLAN: r0=231(x1), r1=100(y1), r2=503(x2), r3=238(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 100
LDI r2, 503
LDI r3, 238
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
