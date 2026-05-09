; DESCRIPTION: Places a yellow line segment connecting (436, 247) to (297, 133).
; PLAN: r0=436(x1), r1=247(y1), r2=297(x2), r3=133(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 247
LDI r2, 297
LDI r3, 133
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
