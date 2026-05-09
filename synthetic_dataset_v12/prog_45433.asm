; DESCRIPTION: Places a green line segment connecting (107, 78) to (452, 37).
; PLAN: r0=107(x1), r1=78(y1), r2=452(x2), r3=37(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 78
LDI r2, 452
LDI r3, 37
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
