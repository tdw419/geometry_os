; DESCRIPTION: Places a black line segment connecting (73, 163) to (191, 187).
; PLAN: r0=73(x1), r1=163(y1), r2=191(x2), r3=187(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 163
LDI r2, 191
LDI r3, 187
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
