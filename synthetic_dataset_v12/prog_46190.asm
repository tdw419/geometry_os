; DESCRIPTION: Places a white line segment connecting (449, 157) to (430, 35).
; PLAN: r0=449(x1), r1=157(y1), r2=430(x2), r3=35(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 157
LDI r2, 430
LDI r3, 35
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
