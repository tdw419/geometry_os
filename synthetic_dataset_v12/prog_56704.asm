; DESCRIPTION: Places a green line segment connecting (78, 164) to (431, 153).
; PLAN: r0=78(x1), r1=164(y1), r2=431(x2), r3=153(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 164
LDI r2, 431
LDI r3, 153
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
