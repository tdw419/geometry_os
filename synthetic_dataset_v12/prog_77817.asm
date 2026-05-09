; DESCRIPTION: Places a green line segment connecting (496, 57) to (451, 30).
; PLAN: r0=496(x1), r1=57(y1), r2=451(x2), r3=30(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 57
LDI r2, 451
LDI r3, 30
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
