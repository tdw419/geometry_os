; DESCRIPTION: Places a orange line segment connecting (92, 194) to (79, 21).
; PLAN: r0=92(x1), r1=194(y1), r2=79(x2), r3=21(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 194
LDI r2, 79
LDI r3, 21
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
