; DESCRIPTION: Places a white line segment connecting (218, 93) to (163, 92).
; PLAN: r0=218(x1), r1=93(y1), r2=163(x2), r3=92(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 93
LDI r2, 163
LDI r3, 92
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
