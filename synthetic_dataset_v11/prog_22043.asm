; DESCRIPTION: Renders a purple line between points (213, 18) and (199, 203).
; PLAN: r0=213(x1), r1=18(y1), r2=199(x2), r3=203(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 18
LDI r2, 199
LDI r3, 203
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
