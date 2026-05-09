; DESCRIPTION: Places a green line segment connecting (409, 140) to (21, 227).
; PLAN: r0=409(x1), r1=140(y1), r2=21(x2), r3=227(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 140
LDI r2, 21
LDI r3, 227
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
