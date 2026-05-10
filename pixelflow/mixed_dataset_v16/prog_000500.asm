; DESCRIPTION: Places a blue line segment connecting (397, 72) to (281, 45).
; PLAN: r0=397(x1), r1=72(y1), r2=281(x2), r3=45(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 72
LDI r2, 281
LDI r3, 45
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
