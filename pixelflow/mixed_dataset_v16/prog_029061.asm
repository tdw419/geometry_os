; DESCRIPTION: Places a white line segment connecting (29, 92) to (318, 38).
; PLAN: r0=29(x1), r1=92(y1), r2=318(x2), r3=38(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 92
LDI r2, 318
LDI r3, 38
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
