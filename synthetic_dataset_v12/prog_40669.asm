; DESCRIPTION: Places a orange line segment connecting (22, 163) to (397, 195).
; PLAN: r0=22(x1), r1=163(y1), r2=397(x2), r3=195(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 163
LDI r2, 397
LDI r3, 195
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
