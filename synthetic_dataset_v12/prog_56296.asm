; DESCRIPTION: Places a orange line segment connecting (443, 232) to (437, 166).
; PLAN: r0=443(x1), r1=232(y1), r2=437(x2), r3=166(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 232
LDI r2, 437
LDI r3, 166
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
