; DESCRIPTION: Places a orange line segment connecting (331, 215) to (257, 34).
; PLAN: r0=331(x1), r1=215(y1), r2=257(x2), r3=34(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 215
LDI r2, 257
LDI r3, 34
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
