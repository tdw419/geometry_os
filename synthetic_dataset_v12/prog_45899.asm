; DESCRIPTION: Places a cyan line segment connecting (430, 56) to (452, 49).
; PLAN: r0=430(x1), r1=56(y1), r2=452(x2), r3=49(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 56
LDI r2, 452
LDI r3, 49
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
