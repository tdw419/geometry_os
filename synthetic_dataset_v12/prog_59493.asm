; DESCRIPTION: Places a orange line segment connecting (458, 50) to (485, 95).
; PLAN: r0=458(x1), r1=50(y1), r2=485(x2), r3=95(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 50
LDI r2, 485
LDI r3, 95
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
