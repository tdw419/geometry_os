; DESCRIPTION: Places a yellow line segment connecting (124, 135) to (75, 0).
; PLAN: r0=124(x1), r1=135(y1), r2=75(x2), r3=0(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 135
LDI r2, 75
LDI r3, 0
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
