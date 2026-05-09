; DESCRIPTION: Places a yellow line segment connecting (322, 34) to (118, 214).
; PLAN: r0=322(x1), r1=34(y1), r2=118(x2), r3=214(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 34
LDI r2, 118
LDI r3, 214
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
