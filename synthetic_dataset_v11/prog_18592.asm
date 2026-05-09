; DESCRIPTION: Places a orange line segment connecting (178, 48) to (178, 63).
; PLAN: r0=178(x1), r1=48(y1), r2=178(x2), r3=63(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 48
LDI r2, 178
LDI r3, 63
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
