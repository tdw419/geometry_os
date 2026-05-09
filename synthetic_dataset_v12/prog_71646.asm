; DESCRIPTION: Places a yellow line segment connecting (264, 120) to (290, 22).
; PLAN: r0=264(x1), r1=120(y1), r2=290(x2), r3=22(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 120
LDI r2, 290
LDI r3, 22
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
