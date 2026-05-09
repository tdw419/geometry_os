; DESCRIPTION: Renders a purple line between points (78, 223) and (203, 60).
; PLAN: r0=78(x1), r1=223(y1), r2=203(x2), r3=60(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 223
LDI r2, 203
LDI r3, 60
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
