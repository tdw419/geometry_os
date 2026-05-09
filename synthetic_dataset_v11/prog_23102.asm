; DESCRIPTION: Renders a purple line between points (59, 240) and (220, 116).
; PLAN: r0=59(x1), r1=240(y1), r2=220(x2), r3=116(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 240
LDI r2, 220
LDI r3, 116
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
