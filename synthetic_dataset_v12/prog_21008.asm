; DESCRIPTION: Places a yellow line segment connecting (21, 87) to (31, 182).
; PLAN: r0=21(x1), r1=87(y1), r2=31(x2), r3=182(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 87
LDI r2, 31
LDI r3, 182
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
