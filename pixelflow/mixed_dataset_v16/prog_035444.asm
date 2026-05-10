; DESCRIPTION: Places a orange line segment connecting (500, 32) to (131, 197).
; PLAN: r0=500(x1), r1=32(y1), r2=131(x2), r3=197(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 32
LDI r2, 131
LDI r3, 197
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
