; DESCRIPTION: Renders a blue line between points (116, 59) and (222, 118).
; PLAN: r0=116(x1), r1=59(y1), r2=222(x2), r3=118(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 59
LDI r2, 222
LDI r3, 118
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
