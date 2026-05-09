; DESCRIPTION: Renders a blue line between points (25, 255) and (145, 74).
; PLAN: r0=25(x1), r1=255(y1), r2=145(x2), r3=74(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 255
LDI r2, 145
LDI r3, 74
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
