; DESCRIPTION: Places a green line segment connecting (364, 204) to (131, 133).
; PLAN: r0=364(x1), r1=204(y1), r2=131(x2), r3=133(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 204
LDI r2, 131
LDI r3, 133
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
