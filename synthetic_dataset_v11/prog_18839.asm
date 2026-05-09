; DESCRIPTION: Draws a white line from (92, 11) to (100, 23).
; PLAN: r0=92(x1), r1=11(y1), r2=100(x2), r3=23(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 11
LDI r2, 100
LDI r3, 23
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
