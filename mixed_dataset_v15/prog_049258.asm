; DESCRIPTION: Draws a white line from (335, 21) to (308, 205).
; PLAN: r0=335(x1), r1=21(y1), r2=308(x2), r3=205(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 21
LDI r2, 308
LDI r3, 205
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
