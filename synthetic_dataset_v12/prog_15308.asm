; DESCRIPTION: Renders a purple line between points (245, 35) and (442, 63).
; PLAN: r0=245(x1), r1=35(y1), r2=442(x2), r3=63(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 35
LDI r2, 442
LDI r3, 63
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
