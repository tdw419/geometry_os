; DESCRIPTION: Draws a orange line from (289, 205) to (57, 76).
; PLAN: r0=289(x1), r1=205(y1), r2=57(x2), r3=76(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 205
LDI r2, 57
LDI r3, 76
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
