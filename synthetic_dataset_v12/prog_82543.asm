; DESCRIPTION: Places a red line segment connecting (334, 218) to (336, 220).
; PLAN: r0=334(x1), r1=218(y1), r2=336(x2), r3=220(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 218
LDI r2, 336
LDI r3, 220
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
