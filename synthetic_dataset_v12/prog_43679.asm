; DESCRIPTION: Places a yellow line segment connecting (112, 204) to (205, 135).
; PLAN: r0=112(x1), r1=204(y1), r2=205(x2), r3=135(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 204
LDI r2, 205
LDI r3, 135
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
