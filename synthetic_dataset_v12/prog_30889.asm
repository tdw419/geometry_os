; DESCRIPTION: Draws a white line from (84, 153) to (335, 47).
; PLAN: r0=84(x1), r1=153(y1), r2=335(x2), r3=47(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 153
LDI r2, 335
LDI r3, 47
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
