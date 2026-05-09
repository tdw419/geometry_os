; DESCRIPTION: Places a blue line segment connecting (12, 138) to (155, 173).
; PLAN: r0=12(x1), r1=138(y1), r2=155(x2), r3=173(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 138
LDI r2, 155
LDI r3, 173
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
