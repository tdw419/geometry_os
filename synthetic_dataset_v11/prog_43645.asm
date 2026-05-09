; DESCRIPTION: Places a green line segment connecting (116, 31) to (137, 74).
; PLAN: r0=116(x1), r1=31(y1), r2=137(x2), r3=74(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 31
LDI r2, 137
LDI r3, 74
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
