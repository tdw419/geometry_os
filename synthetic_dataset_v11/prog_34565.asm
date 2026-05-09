; DESCRIPTION: Places a yellow line segment connecting (165, 58) to (109, 83).
; PLAN: r0=165(x1), r1=58(y1), r2=109(x2), r3=83(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 58
LDI r2, 109
LDI r3, 83
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
