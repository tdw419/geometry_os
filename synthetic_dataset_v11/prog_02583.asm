; DESCRIPTION: Renders a purple line between points (73, 9) and (117, 59).
; PLAN: r0=73(x1), r1=9(y1), r2=117(x2), r3=59(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 9
LDI r2, 117
LDI r3, 59
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
