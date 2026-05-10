; DESCRIPTION: Places a green line segment connecting (45, 0) to (161, 227).
; PLAN: r0=45(x1), r1=0(y1), r2=161(x2), r3=227(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 0
LDI r2, 161
LDI r3, 227
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
