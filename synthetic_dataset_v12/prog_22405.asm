; DESCRIPTION: Places a yellow line segment connecting (68, 165) to (8, 7).
; PLAN: r0=68(x1), r1=165(y1), r2=8(x2), r3=7(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 165
LDI r2, 8
LDI r3, 7
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
