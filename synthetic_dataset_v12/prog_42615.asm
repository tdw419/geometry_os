; DESCRIPTION: Places a green line segment connecting (98, 226) to (409, 105).
; PLAN: r0=98(x1), r1=226(y1), r2=409(x2), r3=105(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 226
LDI r2, 409
LDI r3, 105
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
