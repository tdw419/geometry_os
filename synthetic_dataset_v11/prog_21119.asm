; DESCRIPTION: Places a red line segment connecting (53, 121) to (222, 20).
; PLAN: r0=53(x1), r1=121(y1), r2=222(x2), r3=20(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 121
LDI r2, 222
LDI r3, 20
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
