; DESCRIPTION: Places a yellow line segment connecting (456, 1) to (322, 26).
; PLAN: r0=456(x1), r1=1(y1), r2=322(x2), r3=26(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 1
LDI r2, 322
LDI r3, 26
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
