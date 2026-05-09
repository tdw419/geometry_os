; DESCRIPTION: Renders a blue line between points (76, 155) and (65, 187).
; PLAN: r0=76(x1), r1=155(y1), r2=65(x2), r3=187(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 155
LDI r2, 65
LDI r3, 187
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
