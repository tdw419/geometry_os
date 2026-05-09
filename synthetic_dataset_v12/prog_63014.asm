; DESCRIPTION: Draws a orange line from (160, 85) to (289, 242).
; PLAN: r0=160(x1), r1=85(y1), r2=289(x2), r3=242(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 85
LDI r2, 289
LDI r3, 242
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
