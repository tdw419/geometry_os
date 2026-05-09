; DESCRIPTION: Renders a purple line between points (210, 108) and (14, 4).
; PLAN: r0=210(x1), r1=108(y1), r2=14(x2), r3=4(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 108
LDI r2, 14
LDI r3, 4
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
