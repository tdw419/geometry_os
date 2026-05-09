; DESCRIPTION: Places a white line segment connecting (36, 218) to (252, 134).
; PLAN: r0=36(x1), r1=218(y1), r2=252(x2), r3=134(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 218
LDI r2, 252
LDI r3, 134
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
