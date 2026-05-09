; DESCRIPTION: Places a green line segment connecting (119, 238) to (19, 80).
; PLAN: r0=119(x1), r1=238(y1), r2=19(x2), r3=80(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 238
LDI r2, 19
LDI r3, 80
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
