; DESCRIPTION: Renders a purple line between points (17, 116) and (21, 21).
; PLAN: r0=17(x1), r1=116(y1), r2=21(x2), r3=21(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 116
LDI r2, 21
LDI r3, 21
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
