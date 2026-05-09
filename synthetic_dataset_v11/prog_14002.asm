; DESCRIPTION: Places a green line segment connecting (80, 251) to (40, 206).
; PLAN: r0=80(x1), r1=251(y1), r2=40(x2), r3=206(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 251
LDI r2, 40
LDI r3, 206
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
