; DESCRIPTION: Places a yellow line segment connecting (3, 153) to (225, 184).
; PLAN: r0=3(x1), r1=153(y1), r2=225(x2), r3=184(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 153
LDI r2, 225
LDI r3, 184
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
