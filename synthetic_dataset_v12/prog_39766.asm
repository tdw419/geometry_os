; DESCRIPTION: Places a orange line segment connecting (485, 82) to (387, 94).
; PLAN: r0=485(x1), r1=82(y1), r2=387(x2), r3=94(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 82
LDI r2, 387
LDI r3, 94
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
