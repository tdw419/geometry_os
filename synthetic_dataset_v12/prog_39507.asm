; DESCRIPTION: Draws a orange line from (275, 98) to (286, 76).
; PLAN: r0=275(x1), r1=98(y1), r2=286(x2), r3=76(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 98
LDI r2, 286
LDI r3, 76
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
