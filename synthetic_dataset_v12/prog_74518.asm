; DESCRIPTION: Places a yellow line segment connecting (172, 110) to (111, 55).
; PLAN: r0=172(x1), r1=110(y1), r2=111(x2), r3=55(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 110
LDI r2, 111
LDI r3, 55
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
