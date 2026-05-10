; DESCRIPTION: Renders a purple line segment connecting (263, 8) to (213, 88).
; PLAN: r0=263(x1), r1=8(y1), r2=213(x2), r3=88(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 8
LDI r2, 213
LDI r3, 88
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
