; DESCRIPTION: Places a black line segment connecting (375, 252) to (358, 168).
; PLAN: r0=375(x1), r1=252(y1), r2=358(x2), r3=168(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 252
LDI r2, 358
LDI r3, 168
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
