; DESCRIPTION: Places a green line segment connecting (355, 55) to (26, 194).
; PLAN: r0=355(x1), r1=55(y1), r2=26(x2), r3=194(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 55
LDI r2, 26
LDI r3, 194
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
