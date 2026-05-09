; DESCRIPTION: Places a red line segment connecting (134, 163) to (256, 18).
; PLAN: r0=134(x1), r1=163(y1), r2=256(x2), r3=18(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 163
LDI r2, 256
LDI r3, 18
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
