; DESCRIPTION: Places a green line segment connecting (88, 40) to (327, 80).
; PLAN: r0=88(x1), r1=40(y1), r2=327(x2), r3=80(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 40
LDI r2, 327
LDI r3, 80
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
