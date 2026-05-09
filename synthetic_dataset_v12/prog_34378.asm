; DESCRIPTION: Renders a purple line between points (416, 43) and (485, 133).
; PLAN: r0=416(x1), r1=43(y1), r2=485(x2), r3=133(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 43
LDI r2, 485
LDI r3, 133
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
