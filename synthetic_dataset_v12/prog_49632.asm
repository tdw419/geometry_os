; DESCRIPTION: Places a green line segment connecting (148, 140) to (353, 163).
; PLAN: r0=148(x1), r1=140(y1), r2=353(x2), r3=163(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 140
LDI r2, 353
LDI r3, 163
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
