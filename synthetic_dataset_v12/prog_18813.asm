; DESCRIPTION: Places a orange line segment connecting (326, 92) to (38, 143).
; PLAN: r0=326(x1), r1=92(y1), r2=38(x2), r3=143(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 92
LDI r2, 38
LDI r3, 143
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
