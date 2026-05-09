; DESCRIPTION: Places a yellow line segment connecting (0, 85) to (234, 98).
; PLAN: r0=0(x1), r1=85(y1), r2=234(x2), r3=98(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 85
LDI r2, 234
LDI r3, 98
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
