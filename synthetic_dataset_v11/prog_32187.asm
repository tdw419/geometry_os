; DESCRIPTION: Places a orange line segment connecting (172, 197) to (140, 116).
; PLAN: r0=172(x1), r1=197(y1), r2=140(x2), r3=116(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 197
LDI r2, 140
LDI r3, 116
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
