; DESCRIPTION: Places a green line segment connecting (28, 26) to (439, 156).
; PLAN: r0=28(x1), r1=26(y1), r2=439(x2), r3=156(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 26
LDI r2, 439
LDI r3, 156
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
