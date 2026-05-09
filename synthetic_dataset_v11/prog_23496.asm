; DESCRIPTION: Places a green line segment connecting (72, 184) to (170, 70).
; PLAN: r0=72(x1), r1=184(y1), r2=170(x2), r3=70(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 184
LDI r2, 170
LDI r3, 70
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
