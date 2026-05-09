; DESCRIPTION: Places a red line segment connecting (327, 141) to (131, 3).
; PLAN: r0=327(x1), r1=141(y1), r2=131(x2), r3=3(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 141
LDI r2, 131
LDI r3, 3
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
