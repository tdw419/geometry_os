; DESCRIPTION: Renders a purple line between points (491, 237) and (491, 43).
; PLAN: r0=491(x1), r1=237(y1), r2=491(x2), r3=43(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 237
LDI r2, 491
LDI r3, 43
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
