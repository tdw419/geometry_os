; DESCRIPTION: Places a green line segment connecting (254, 28) to (109, 140).
; PLAN: r0=254(x1), r1=28(y1), r2=109(x2), r3=140(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 28
LDI r2, 109
LDI r3, 140
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
