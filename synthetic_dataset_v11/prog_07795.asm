; DESCRIPTION: Places a yellow line segment connecting (138, 198) to (166, 16).
; PLAN: r0=138(x1), r1=198(y1), r2=166(x2), r3=16(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 198
LDI r2, 166
LDI r3, 16
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
