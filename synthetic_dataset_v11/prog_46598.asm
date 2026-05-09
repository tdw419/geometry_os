; DESCRIPTION: Draws a orange line from (41, 191) to (193, 12).
; PLAN: r0=41(x1), r1=191(y1), r2=193(x2), r3=12(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 191
LDI r2, 193
LDI r3, 12
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
