; DESCRIPTION: Renders a purple line between points (59, 72) and (22, 54).
; PLAN: r0=59(x1), r1=72(y1), r2=22(x2), r3=54(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 72
LDI r2, 22
LDI r3, 54
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
