; DESCRIPTION: Renders a purple line between points (59, 161) and (47, 9).
; PLAN: r0=59(x1), r1=161(y1), r2=47(x2), r3=9(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 161
LDI r2, 47
LDI r3, 9
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
