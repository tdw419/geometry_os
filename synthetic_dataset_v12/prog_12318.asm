; DESCRIPTION: Places a green line segment connecting (421, 184) to (473, 255).
; PLAN: r0=421(x1), r1=184(y1), r2=473(x2), r3=255(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 184
LDI r2, 473
LDI r3, 255
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
