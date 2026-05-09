; DESCRIPTION: Draws a orange line from (92, 142) to (100, 37).
; PLAN: r0=92(x1), r1=142(y1), r2=100(x2), r3=37(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 142
LDI r2, 100
LDI r3, 37
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
