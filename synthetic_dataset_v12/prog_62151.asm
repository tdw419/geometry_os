; DESCRIPTION: Places a yellow line segment connecting (50, 91) to (322, 0).
; PLAN: r0=50(x1), r1=91(y1), r2=322(x2), r3=0(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 91
LDI r2, 322
LDI r3, 0
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
