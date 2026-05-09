; DESCRIPTION: Draws a purple line from (182, 130) to (203, 148).
; PLAN: r0=182(x1), r1=130(y1), r2=203(x2), r3=148(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 130
LDI r2, 203
LDI r3, 148
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
