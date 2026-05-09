; DESCRIPTION: Places a green line segment connecting (179, 250) to (101, 135).
; PLAN: r0=179(x1), r1=250(y1), r2=101(x2), r3=135(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 250
LDI r2, 101
LDI r3, 135
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
