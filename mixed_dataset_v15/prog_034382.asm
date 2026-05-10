; DESCRIPTION: Renders a blue line between points (483, 255) and (59, 158).
; PLAN: r0=483(x1), r1=255(y1), r2=59(x2), r3=158(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 255
LDI r2, 59
LDI r3, 158
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
