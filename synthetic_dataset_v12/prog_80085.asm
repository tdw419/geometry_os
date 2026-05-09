; DESCRIPTION: Places a orange line segment connecting (304, 191) to (333, 120).
; PLAN: r0=304(x1), r1=191(y1), r2=333(x2), r3=120(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 191
LDI r2, 333
LDI r3, 120
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
