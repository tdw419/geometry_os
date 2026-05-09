; DESCRIPTION: Draws a orange line from (380, 53) to (388, 98).
; PLAN: r0=380(x1), r1=53(y1), r2=388(x2), r3=98(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 53
LDI r2, 388
LDI r3, 98
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
