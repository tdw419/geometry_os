; DESCRIPTION: Places a yellow line segment connecting (141, 56) to (146, 205).
; PLAN: r0=141(x1), r1=56(y1), r2=146(x2), r3=205(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 56
LDI r2, 146
LDI r3, 205
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
