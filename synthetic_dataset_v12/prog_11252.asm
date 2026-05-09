; DESCRIPTION: Places a green line segment connecting (21, 45) to (134, 2).
; PLAN: r0=21(x1), r1=45(y1), r2=134(x2), r3=2(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 45
LDI r2, 134
LDI r3, 2
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
