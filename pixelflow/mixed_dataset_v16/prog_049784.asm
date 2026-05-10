; DESCRIPTION: Places a orange line segment connecting (380, 234) to (437, 101).
; PLAN: r0=380(x1), r1=234(y1), r2=437(x2), r3=101(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 234
LDI r2, 437
LDI r3, 101
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
