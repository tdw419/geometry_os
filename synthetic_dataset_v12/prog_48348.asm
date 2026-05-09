; DESCRIPTION: Places a blue line segment connecting (286, 184) to (473, 24).
; PLAN: r0=286(x1), r1=184(y1), r2=473(x2), r3=24(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 184
LDI r2, 473
LDI r3, 24
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
