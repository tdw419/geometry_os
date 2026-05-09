; DESCRIPTION: Places a white line segment connecting (477, 152) to (472, 233).
; PLAN: r0=477(x1), r1=152(y1), r2=472(x2), r3=233(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 152
LDI r2, 472
LDI r3, 233
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
