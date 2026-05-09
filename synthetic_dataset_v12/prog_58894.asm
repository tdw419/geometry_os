; DESCRIPTION: Places a yellow line segment connecting (222, 68) to (23, 222).
; PLAN: r0=222(x1), r1=68(y1), r2=23(x2), r3=222(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 68
LDI r2, 23
LDI r3, 222
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
