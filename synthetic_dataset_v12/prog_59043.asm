; DESCRIPTION: Renders a purple line between points (426, 87) and (263, 88).
; PLAN: r0=426(x1), r1=87(y1), r2=263(x2), r3=88(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 87
LDI r2, 263
LDI r3, 88
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
