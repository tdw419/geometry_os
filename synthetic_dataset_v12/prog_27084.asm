; DESCRIPTION: Renders a magenta line between points (478, 203) and (278, 122).
; PLAN: r0=478(x1), r1=203(y1), r2=278(x2), r3=122(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 203
LDI r2, 278
LDI r3, 122
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
