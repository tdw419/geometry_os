; DESCRIPTION: Places a yellow line segment connecting (359, 104) to (152, 56).
; PLAN: r0=359(x1), r1=104(y1), r2=152(x2), r3=56(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 104
LDI r2, 152
LDI r3, 56
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
