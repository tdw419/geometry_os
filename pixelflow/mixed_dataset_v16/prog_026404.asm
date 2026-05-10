; DESCRIPTION: Draws a orange line from (371, 109) to (335, 47).
; PLAN: r0=371(x1), r1=109(y1), r2=335(x2), r3=47(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 109
LDI r2, 335
LDI r3, 47
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
