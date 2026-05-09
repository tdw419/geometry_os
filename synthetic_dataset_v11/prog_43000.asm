; DESCRIPTION: Places a yellow line segment connecting (239, 76) to (115, 100).
; PLAN: r0=239(x1), r1=76(y1), r2=115(x2), r3=100(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 76
LDI r2, 115
LDI r3, 100
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
