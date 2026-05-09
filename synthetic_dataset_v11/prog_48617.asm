; DESCRIPTION: Places a yellow line segment connecting (55, 11) to (135, 81).
; PLAN: r0=55(x1), r1=11(y1), r2=135(x2), r3=81(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 11
LDI r2, 135
LDI r3, 81
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
