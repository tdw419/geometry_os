; DESCRIPTION: Places a blue line segment connecting (125, 140) to (122, 0).
; PLAN: r0=125(x1), r1=140(y1), r2=122(x2), r3=0(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 140
LDI r2, 122
LDI r3, 0
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
