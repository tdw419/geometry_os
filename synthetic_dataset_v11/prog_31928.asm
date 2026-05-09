; DESCRIPTION: Places a yellow line segment connecting (153, 116) to (251, 241).
; PLAN: r0=153(x1), r1=116(y1), r2=251(x2), r3=241(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 116
LDI r2, 251
LDI r3, 241
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
