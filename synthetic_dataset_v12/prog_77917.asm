; DESCRIPTION: Places a black line segment connecting (32, 63) to (437, 78).
; PLAN: r0=32(x1), r1=63(y1), r2=437(x2), r3=78(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 63
LDI r2, 437
LDI r3, 78
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
