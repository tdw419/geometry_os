; DESCRIPTION: Draws a orange line from (228, 119) to (145, 92).
; PLAN: r0=228(x1), r1=119(y1), r2=145(x2), r3=92(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 119
LDI r2, 145
LDI r3, 92
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
