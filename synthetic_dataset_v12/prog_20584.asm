; DESCRIPTION: Places a black line segment connecting (234, 170) to (481, 128).
; PLAN: r0=234(x1), r1=170(y1), r2=481(x2), r3=128(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 170
LDI r2, 481
LDI r3, 128
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
