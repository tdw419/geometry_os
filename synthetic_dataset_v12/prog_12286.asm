; DESCRIPTION: Places a orange line segment connecting (430, 197) to (82, 153).
; PLAN: r0=430(x1), r1=197(y1), r2=82(x2), r3=153(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 197
LDI r2, 82
LDI r3, 153
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
