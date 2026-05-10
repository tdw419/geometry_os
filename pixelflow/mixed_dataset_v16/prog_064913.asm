; DESCRIPTION: Renders a purple line between points (423, 84) and (420, 239).
; PLAN: r0=423(x1), r1=84(y1), r2=420(x2), r3=239(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 84
LDI r2, 420
LDI r3, 239
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
