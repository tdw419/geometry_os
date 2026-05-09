; DESCRIPTION: Places a yellow line segment connecting (11, 14) to (322, 141).
; PLAN: r0=11(x1), r1=14(y1), r2=322(x2), r3=141(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 14
LDI r2, 322
LDI r3, 141
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
