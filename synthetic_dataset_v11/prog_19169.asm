; DESCRIPTION: Places a yellow line segment connecting (217, 49) to (141, 98).
; PLAN: r0=217(x1), r1=49(y1), r2=141(x2), r3=98(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 49
LDI r2, 141
LDI r3, 98
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
