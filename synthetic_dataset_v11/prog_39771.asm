; DESCRIPTION: Places a green line segment connecting (16, 99) to (43, 157).
; PLAN: r0=16(x1), r1=99(y1), r2=43(x2), r3=157(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 99
LDI r2, 43
LDI r3, 157
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
