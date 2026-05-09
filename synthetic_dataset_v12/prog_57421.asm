; DESCRIPTION: Places a orange line segment connecting (354, 191) to (157, 87).
; PLAN: r0=354(x1), r1=191(y1), r2=157(x2), r3=87(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 191
LDI r2, 157
LDI r3, 87
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
