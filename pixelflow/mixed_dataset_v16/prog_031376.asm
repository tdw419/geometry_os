; DESCRIPTION: Renders a blue line between points (230, 76) and (188, 9).
; PLAN: r0=230(x1), r1=76(y1), r2=188(x2), r3=9(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 76
LDI r2, 188
LDI r3, 9
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
