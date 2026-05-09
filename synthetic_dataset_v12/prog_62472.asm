; DESCRIPTION: Renders a purple line between points (48, 203) and (395, 221).
; PLAN: r0=48(x1), r1=203(y1), r2=395(x2), r3=221(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 203
LDI r2, 395
LDI r3, 221
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
