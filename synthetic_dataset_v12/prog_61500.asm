; DESCRIPTION: Renders a purple line between points (86, 11) and (304, 48).
; PLAN: r0=86(x1), r1=11(y1), r2=304(x2), r3=48(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 11
LDI r2, 304
LDI r3, 48
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
