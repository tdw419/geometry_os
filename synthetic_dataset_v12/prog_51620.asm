; DESCRIPTION: Places a white line segment connecting (234, 36) to (496, 28).
; PLAN: r0=234(x1), r1=36(y1), r2=496(x2), r3=28(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 36
LDI r2, 496
LDI r3, 28
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
