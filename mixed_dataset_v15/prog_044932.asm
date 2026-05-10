; DESCRIPTION: Places a white line segment connecting (92, 218) to (262, 188).
; PLAN: r0=92(x1), r1=218(y1), r2=262(x2), r3=188(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 218
LDI r2, 262
LDI r3, 188
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
