; DESCRIPTION: Places a black line segment connecting (42, 218) to (335, 117).
; PLAN: r0=42(x1), r1=218(y1), r2=335(x2), r3=117(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 218
LDI r2, 335
LDI r3, 117
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
