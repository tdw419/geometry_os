; DESCRIPTION: Places a green line segment connecting (76, 232) to (456, 86).
; PLAN: r0=76(x1), r1=232(y1), r2=456(x2), r3=86(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 232
LDI r2, 456
LDI r3, 86
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
