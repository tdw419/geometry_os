; DESCRIPTION: Places a green line segment connecting (117, 34) to (58, 133).
; PLAN: r0=117(x1), r1=34(y1), r2=58(x2), r3=133(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 34
LDI r2, 58
LDI r3, 133
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
