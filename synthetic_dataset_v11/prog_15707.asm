; DESCRIPTION: Places a black line segment connecting (114, 68) to (89, 103).
; PLAN: r0=114(x1), r1=68(y1), r2=89(x2), r3=103(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 68
LDI r2, 89
LDI r3, 103
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
