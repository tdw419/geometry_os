; DESCRIPTION: Renders a purple line between points (503, 32) and (227, 78).
; PLAN: r0=503(x1), r1=32(y1), r2=227(x2), r3=78(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 32
LDI r2, 227
LDI r3, 78
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
