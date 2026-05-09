; DESCRIPTION: Places a black line segment connecting (85, 178) to (454, 62).
; PLAN: r0=85(x1), r1=178(y1), r2=454(x2), r3=62(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 178
LDI r2, 454
LDI r3, 62
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
