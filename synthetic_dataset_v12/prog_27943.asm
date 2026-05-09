; DESCRIPTION: Places a yellow line segment connecting (81, 177) to (376, 177).
; PLAN: r0=81(x1), r1=177(y1), r2=376(x2), r3=177(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 177
LDI r2, 376
LDI r3, 177
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
