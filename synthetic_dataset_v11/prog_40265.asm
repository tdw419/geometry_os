; DESCRIPTION: Renders a purple line between points (203, 52) and (12, 198).
; PLAN: r0=203(x1), r1=52(y1), r2=12(x2), r3=198(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 52
LDI r2, 12
LDI r3, 198
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
