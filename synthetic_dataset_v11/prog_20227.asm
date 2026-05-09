; DESCRIPTION: Places a red line segment connecting (128, 119) to (195, 99).
; PLAN: r0=128(x1), r1=119(y1), r2=195(x2), r3=99(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 119
LDI r2, 195
LDI r3, 99
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
