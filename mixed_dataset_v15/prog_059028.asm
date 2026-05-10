; DESCRIPTION: Draws a orange line from (193, 53) to (310, 12).
; PLAN: r0=193(x1), r1=53(y1), r2=310(x2), r3=12(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 53
LDI r2, 310
LDI r3, 12
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
