; DESCRIPTION: Places a green line segment connecting (19, 138) to (55, 251).
; PLAN: r0=19(x1), r1=138(y1), r2=55(x2), r3=251(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 138
LDI r2, 55
LDI r3, 251
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
