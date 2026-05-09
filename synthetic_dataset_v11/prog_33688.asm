; DESCRIPTION: Places a green line segment connecting (43, 157) to (101, 13).
; PLAN: r0=43(x1), r1=157(y1), r2=101(x2), r3=13(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 157
LDI r2, 101
LDI r3, 13
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
