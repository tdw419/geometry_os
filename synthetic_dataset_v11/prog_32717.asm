; DESCRIPTION: Places a yellow line segment connecting (255, 253) to (62, 58).
; PLAN: r0=255(x1), r1=253(y1), r2=62(x2), r3=58(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 253
LDI r2, 62
LDI r3, 58
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
