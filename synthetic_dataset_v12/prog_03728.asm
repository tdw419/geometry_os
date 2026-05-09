; DESCRIPTION: Places a orange line segment connecting (449, 0) to (164, 128).
; PLAN: r0=449(x1), r1=0(y1), r2=164(x2), r3=128(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 0
LDI r2, 164
LDI r3, 128
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
