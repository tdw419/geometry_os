; DESCRIPTION: Places a yellow line segment connecting (454, 122) to (345, 63).
; PLAN: r0=454(x1), r1=122(y1), r2=345(x2), r3=63(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 122
LDI r2, 345
LDI r3, 63
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
