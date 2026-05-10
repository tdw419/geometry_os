; DESCRIPTION: Renders a purple line between points (203, 35) and (324, 108).
; PLAN: r0=203(x1), r1=35(y1), r2=324(x2), r3=108(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 35
LDI r2, 324
LDI r3, 108
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
