; DESCRIPTION: Places a green line segment connecting (486, 133) to (134, 244).
; PLAN: r0=486(x1), r1=133(y1), r2=134(x2), r3=244(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 133
LDI r2, 134
LDI r3, 244
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
