; DESCRIPTION: Places a orange line segment connecting (45, 6) to (108, 171).
; PLAN: r0=45(x1), r1=6(y1), r2=108(x2), r3=171(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 6
LDI r2, 108
LDI r3, 171
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
