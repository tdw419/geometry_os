; DESCRIPTION: Places a yellow line segment connecting (81, 80) to (73, 73).
; PLAN: r0=81(x1), r1=80(y1), r2=73(x2), r3=73(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 80
LDI r2, 73
LDI r3, 73
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
