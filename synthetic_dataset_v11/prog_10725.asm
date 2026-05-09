; DESCRIPTION: Places a white line segment connecting (13, 244) to (56, 70).
; PLAN: r0=13(x1), r1=244(y1), r2=56(x2), r3=70(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 244
LDI r2, 56
LDI r3, 70
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
