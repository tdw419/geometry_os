; DESCRIPTION: Places a green line segment connecting (218, 157) to (260, 159).
; PLAN: r0=218(x1), r1=157(y1), r2=260(x2), r3=159(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 157
LDI r2, 260
LDI r3, 159
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
