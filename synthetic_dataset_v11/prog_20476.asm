; DESCRIPTION: Places a green line segment connecting (58, 29) to (200, 121).
; PLAN: r0=58(x1), r1=29(y1), r2=200(x2), r3=121(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 29
LDI r2, 200
LDI r3, 121
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
