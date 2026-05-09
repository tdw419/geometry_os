; DESCRIPTION: Places a orange line segment connecting (353, 48) to (289, 87).
; PLAN: r0=353(x1), r1=48(y1), r2=289(x2), r3=87(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 48
LDI r2, 289
LDI r3, 87
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
