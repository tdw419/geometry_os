; DESCRIPTION: Places a white line segment connecting (401, 142) to (457, 147).
; PLAN: r0=401(x1), r1=142(y1), r2=457(x2), r3=147(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 142
LDI r2, 457
LDI r3, 147
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
