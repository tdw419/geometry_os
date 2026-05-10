; DESCRIPTION: Places a green line segment connecting (492, 149) to (244, 23).
; PLAN: r0=492(x1), r1=149(y1), r2=244(x2), r3=23(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 149
LDI r2, 244
LDI r3, 23
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
