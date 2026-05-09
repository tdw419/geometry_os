; DESCRIPTION: Places a green line segment connecting (119, 77) to (409, 24).
; PLAN: r0=119(x1), r1=77(y1), r2=409(x2), r3=24(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 77
LDI r2, 409
LDI r3, 24
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
