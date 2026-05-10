; DESCRIPTION: Places a yellow line segment connecting (485, 36) to (452, 41).
; PLAN: r0=485(x1), r1=36(y1), r2=452(x2), r3=41(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 36
LDI r2, 452
LDI r3, 41
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
