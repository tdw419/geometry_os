; DESCRIPTION: Places a white line segment connecting (173, 238) to (335, 75).
; PLAN: r0=173(x1), r1=238(y1), r2=335(x2), r3=75(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 238
LDI r2, 335
LDI r3, 75
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
