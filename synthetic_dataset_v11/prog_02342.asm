; DESCRIPTION: Places a yellow line segment connecting (139, 97) to (196, 101).
; PLAN: r0=139(x1), r1=97(y1), r2=196(x2), r3=101(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 97
LDI r2, 196
LDI r3, 101
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
