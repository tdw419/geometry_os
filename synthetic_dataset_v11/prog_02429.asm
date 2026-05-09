; DESCRIPTION: Places a green line segment connecting (5, 227) to (32, 108).
; PLAN: r0=5(x1), r1=227(y1), r2=32(x2), r3=108(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 227
LDI r2, 32
LDI r3, 108
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
