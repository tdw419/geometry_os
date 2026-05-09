; DESCRIPTION: Draws a orange line from (389, 11) to (280, 108).
; PLAN: r0=389(x1), r1=11(y1), r2=280(x2), r3=108(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 11
LDI r2, 280
LDI r3, 108
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
