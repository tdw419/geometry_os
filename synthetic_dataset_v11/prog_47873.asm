; DESCRIPTION: Renders a purple line between points (227, 205) and (158, 182).
; PLAN: r0=227(x1), r1=205(y1), r2=158(x2), r3=182(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 205
LDI r2, 158
LDI r3, 182
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
