; DESCRIPTION: Places a yellow line segment connecting (135, 71) to (119, 102).
; PLAN: r0=135(x1), r1=71(y1), r2=119(x2), r3=102(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 71
LDI r2, 119
LDI r3, 102
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
