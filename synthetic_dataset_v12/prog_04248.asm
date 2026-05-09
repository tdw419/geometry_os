; DESCRIPTION: Places a yellow line segment connecting (264, 12) to (73, 65).
; PLAN: r0=264(x1), r1=12(y1), r2=73(x2), r3=65(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 12
LDI r2, 73
LDI r3, 65
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
