; DESCRIPTION: Places a cyan line segment connecting (56, 156) to (3, 98).
; PLAN: r0=56(x1), r1=156(y1), r2=3(x2), r3=98(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 156
LDI r2, 3
LDI r3, 98
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
