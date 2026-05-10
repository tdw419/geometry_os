; DESCRIPTION: Places a black line segment connecting (299, 163) to (117, 145).
; PLAN: r0=299(x1), r1=163(y1), r2=117(x2), r3=145(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 163
LDI r2, 117
LDI r3, 145
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
