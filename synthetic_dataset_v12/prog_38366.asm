; DESCRIPTION: Places a black line segment connecting (365, 163) to (48, 145).
; PLAN: r0=365(x1), r1=163(y1), r2=48(x2), r3=145(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 163
LDI r2, 48
LDI r3, 145
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
