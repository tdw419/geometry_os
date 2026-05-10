; DESCRIPTION: Renders a yellow line segment connecting (124, 137) to (221, 55).
; PLAN: r0=124(x1), r1=137(y1), r2=221(x2), r3=55(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 137
LDI r2, 221
LDI r3, 55
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
