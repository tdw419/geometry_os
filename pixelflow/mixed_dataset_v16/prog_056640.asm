; DESCRIPTION: Draws a white line from (13, 134) to (200, 92).
; PLAN: r0=13(x1), r1=134(y1), r2=200(x2), r3=92(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 134
LDI r2, 200
LDI r3, 92
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
