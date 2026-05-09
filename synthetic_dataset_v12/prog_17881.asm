; DESCRIPTION: Renders a purple line between points (325, 43) and (403, 7).
; PLAN: r0=325(x1), r1=43(y1), r2=403(x2), r3=7(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 43
LDI r2, 403
LDI r3, 7
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
