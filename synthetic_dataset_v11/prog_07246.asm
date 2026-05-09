; DESCRIPTION: Places a white line segment connecting (255, 102) to (147, 73).
; PLAN: r0=255(x1), r1=102(y1), r2=147(x2), r3=73(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 102
LDI r2, 147
LDI r3, 73
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
