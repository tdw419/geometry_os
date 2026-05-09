; DESCRIPTION: Renders a purple line between points (16, 132) and (129, 62).
; PLAN: r0=16(x1), r1=132(y1), r2=129(x2), r3=62(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 132
LDI r2, 129
LDI r3, 62
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
