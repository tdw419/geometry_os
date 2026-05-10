; DESCRIPTION: Draws a orange line from (69, 145) to (92, 66).
; PLAN: r0=69(x1), r1=145(y1), r2=92(x2), r3=66(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 145
LDI r2, 92
LDI r3, 66
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
