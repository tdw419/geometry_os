; DESCRIPTION: Places a orange line segment connecting (401, 41) to (396, 164).
; PLAN: r0=401(x1), r1=41(y1), r2=396(x2), r3=164(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 41
LDI r2, 396
LDI r3, 164
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
