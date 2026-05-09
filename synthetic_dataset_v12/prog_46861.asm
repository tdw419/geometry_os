; DESCRIPTION: Places a yellow line segment connecting (474, 177) to (304, 185).
; PLAN: r0=474(x1), r1=177(y1), r2=304(x2), r3=185(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 177
LDI r2, 304
LDI r3, 185
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
