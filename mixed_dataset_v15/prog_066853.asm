; DESCRIPTION: Renders a purple line between points (29, 1) and (182, 206).
; PLAN: r0=29(x1), r1=1(y1), r2=182(x2), r3=206(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 1
LDI r2, 182
LDI r3, 206
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
