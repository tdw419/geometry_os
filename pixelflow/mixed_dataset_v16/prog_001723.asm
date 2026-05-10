; DESCRIPTION: Renders a blue line between points (155, 76) and (271, 214).
; PLAN: r0=155(x1), r1=76(y1), r2=271(x2), r3=214(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 76
LDI r2, 271
LDI r3, 214
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
