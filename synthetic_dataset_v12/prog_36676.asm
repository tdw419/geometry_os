; DESCRIPTION: Places a green line segment connecting (2, 232) to (24, 71).
; PLAN: r0=2(x1), r1=232(y1), r2=24(x2), r3=71(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 232
LDI r2, 24
LDI r3, 71
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
