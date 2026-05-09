; DESCRIPTION: Places a green line segment connecting (299, 28) to (311, 98).
; PLAN: r0=299(x1), r1=28(y1), r2=311(x2), r3=98(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 28
LDI r2, 311
LDI r3, 98
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
