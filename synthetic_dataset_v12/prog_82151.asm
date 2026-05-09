; DESCRIPTION: Places a cyan line segment connecting (287, 85) to (421, 145).
; PLAN: r0=287(x1), r1=85(y1), r2=421(x2), r3=145(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 85
LDI r2, 421
LDI r3, 145
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
