; DESCRIPTION: Places a yellow line segment connecting (308, 73) to (496, 231).
; PLAN: r0=308(x1), r1=73(y1), r2=496(x2), r3=231(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 73
LDI r2, 496
LDI r3, 231
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
