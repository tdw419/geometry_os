; DESCRIPTION: Renders a blue line between points (59, 122) and (185, 188).
; PLAN: r0=59(x1), r1=122(y1), r2=185(x2), r3=188(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 122
LDI r2, 185
LDI r3, 188
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
