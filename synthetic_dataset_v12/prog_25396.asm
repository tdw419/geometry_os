; DESCRIPTION: Places a green line segment connecting (245, 86) to (84, 34).
; PLAN: r0=245(x1), r1=86(y1), r2=84(x2), r3=34(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 86
LDI r2, 84
LDI r3, 34
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
