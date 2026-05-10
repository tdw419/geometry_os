; DESCRIPTION: Places a green line segment connecting (304, 244) to (97, 110).
; PLAN: r0=304(x1), r1=244(y1), r2=97(x2), r3=110(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 244
LDI r2, 97
LDI r3, 110
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
