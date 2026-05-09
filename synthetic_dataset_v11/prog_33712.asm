; DESCRIPTION: Renders a purple line between points (232, 192) and (239, 47).
; PLAN: r0=232(x1), r1=192(y1), r2=239(x2), r3=47(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 192
LDI r2, 239
LDI r3, 47
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
