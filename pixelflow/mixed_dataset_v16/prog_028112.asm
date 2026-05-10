; DESCRIPTION: Places a white line segment connecting (222, 141) to (131, 246).
; PLAN: r0=222(x1), r1=141(y1), r2=131(x2), r3=246(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 141
LDI r2, 131
LDI r3, 246
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
