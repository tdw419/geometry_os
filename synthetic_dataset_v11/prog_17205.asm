; DESCRIPTION: Draws a orange line from (53, 66) to (92, 5).
; PLAN: r0=53(x1), r1=66(y1), r2=92(x2), r3=5(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 66
LDI r2, 92
LDI r3, 5
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
