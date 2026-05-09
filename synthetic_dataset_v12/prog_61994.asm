; DESCRIPTION: Places a yellow line segment connecting (120, 20) to (322, 248).
; PLAN: r0=120(x1), r1=20(y1), r2=322(x2), r3=248(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 20
LDI r2, 322
LDI r3, 248
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
