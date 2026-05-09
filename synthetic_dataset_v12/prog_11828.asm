; DESCRIPTION: Places a green line segment connecting (110, 78) to (325, 70).
; PLAN: r0=110(x1), r1=78(y1), r2=325(x2), r3=70(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 78
LDI r2, 325
LDI r3, 70
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
