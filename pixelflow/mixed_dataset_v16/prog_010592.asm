; DESCRIPTION: Places a orange line segment connecting (141, 171) to (219, 6).
; PLAN: r0=141(x1), r1=171(y1), r2=219(x2), r3=6(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 171
LDI r2, 219
LDI r3, 6
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
