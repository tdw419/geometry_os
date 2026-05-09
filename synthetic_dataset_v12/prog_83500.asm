; DESCRIPTION: Draws a white line from (420, 92) to (163, 145).
; PLAN: r0=420(x1), r1=92(y1), r2=163(x2), r3=145(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 92
LDI r2, 163
LDI r3, 145
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
