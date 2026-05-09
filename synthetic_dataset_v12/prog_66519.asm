; DESCRIPTION: Places a yellow line segment connecting (435, 151) to (100, 49).
; PLAN: r0=435(x1), r1=151(y1), r2=100(x2), r3=49(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 151
LDI r2, 100
LDI r3, 49
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
