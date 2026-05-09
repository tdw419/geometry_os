; DESCRIPTION: Renders a purple line between points (420, 183) and (33, 158).
; PLAN: r0=420(x1), r1=183(y1), r2=33(x2), r3=158(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 183
LDI r2, 33
LDI r3, 158
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
