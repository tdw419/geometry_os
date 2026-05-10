; DESCRIPTION: Renders a blue line segment connecting (76, 171) to (230, 167).
; PLAN: r0=76(x1), r1=171(y1), r2=230(x2), r3=167(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 171
LDI r2, 230
LDI r3, 167
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
