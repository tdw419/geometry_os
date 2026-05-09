; DESCRIPTION: Renders a purple line between points (239, 75) and (124, 54).
; PLAN: r0=239(x1), r1=75(y1), r2=124(x2), r3=54(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 75
LDI r2, 124
LDI r3, 54
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
