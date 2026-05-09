; DESCRIPTION: Places a orange line segment connecting (131, 3) to (32, 206).
; PLAN: r0=131(x1), r1=3(y1), r2=32(x2), r3=206(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 3
LDI r2, 32
LDI r3, 206
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
