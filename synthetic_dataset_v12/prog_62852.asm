; DESCRIPTION: Places a green line segment connecting (483, 160) to (35, 250).
; PLAN: r0=483(x1), r1=160(y1), r2=35(x2), r3=250(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 160
LDI r2, 35
LDI r3, 250
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
