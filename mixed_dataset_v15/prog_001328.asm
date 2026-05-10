; DESCRIPTION: Places a green line segment connecting (475, 138) to (478, 234).
; PLAN: r0=475(x1), r1=138(y1), r2=478(x2), r3=234(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 138
LDI r2, 478
LDI r3, 234
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
