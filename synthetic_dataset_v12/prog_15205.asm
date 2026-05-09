; DESCRIPTION: Places a cyan line segment connecting (472, 95) to (314, 53).
; PLAN: r0=472(x1), r1=95(y1), r2=314(x2), r3=53(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 95
LDI r2, 314
LDI r3, 53
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
