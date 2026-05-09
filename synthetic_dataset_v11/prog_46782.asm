; DESCRIPTION: Places a yellow line segment connecting (181, 153) to (102, 44).
; PLAN: r0=181(x1), r1=153(y1), r2=102(x2), r3=44(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 153
LDI r2, 102
LDI r3, 44
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
