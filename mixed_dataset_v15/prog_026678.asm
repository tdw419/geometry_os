; DESCRIPTION: Places a green line segment connecting (9, 151) to (53, 110).
; PLAN: r0=9(x1), r1=151(y1), r2=53(x2), r3=110(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 151
LDI r2, 53
LDI r3, 110
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
