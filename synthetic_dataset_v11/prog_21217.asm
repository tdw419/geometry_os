; DESCRIPTION: Places a yellow line segment connecting (8, 124) to (35, 2).
; PLAN: r0=8(x1), r1=124(y1), r2=35(x2), r3=2(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 124
LDI r2, 35
LDI r3, 2
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
