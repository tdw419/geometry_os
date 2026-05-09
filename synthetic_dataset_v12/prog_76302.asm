; DESCRIPTION: Places a cyan line segment connecting (258, 72) to (325, 49).
; PLAN: r0=258(x1), r1=72(y1), r2=325(x2), r3=49(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 72
LDI r2, 325
LDI r3, 49
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
