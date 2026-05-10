; DESCRIPTION: Places a cyan line segment connecting (250, 170) to (265, 133).
; PLAN: r0=250(x1), r1=170(y1), r2=265(x2), r3=133(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 170
LDI r2, 265
LDI r3, 133
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
