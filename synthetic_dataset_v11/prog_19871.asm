; DESCRIPTION: Places a black line segment connecting (234, 140) to (13, 249).
; PLAN: r0=234(x1), r1=140(y1), r2=13(x2), r3=249(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 140
LDI r2, 13
LDI r3, 249
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
