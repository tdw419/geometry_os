; DESCRIPTION: Places a green line segment connecting (102, 106) to (140, 122).
; PLAN: r0=102(x1), r1=106(y1), r2=140(x2), r3=122(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 106
LDI r2, 140
LDI r3, 122
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
