; DESCRIPTION: Places a orange line segment connecting (335, 63) to (241, 173).
; PLAN: r0=335(x1), r1=63(y1), r2=241(x2), r3=173(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 63
LDI r2, 241
LDI r3, 173
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
