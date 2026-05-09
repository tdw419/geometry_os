; DESCRIPTION: Renders a purple line between points (28, 203) and (219, 183).
; PLAN: r0=28(x1), r1=203(y1), r2=219(x2), r3=183(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 203
LDI r2, 219
LDI r3, 183
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
