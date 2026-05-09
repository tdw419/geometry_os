; DESCRIPTION: Places a yellow line segment connecting (183, 87) to (241, 183).
; PLAN: r0=183(x1), r1=87(y1), r2=241(x2), r3=183(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 87
LDI r2, 241
LDI r3, 183
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
