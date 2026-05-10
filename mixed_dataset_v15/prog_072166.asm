; DESCRIPTION: Places a white line segment connecting (336, 192) to (436, 81).
; PLAN: r0=336(x1), r1=192(y1), r2=436(x2), r3=81(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 192
LDI r2, 436
LDI r3, 81
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
