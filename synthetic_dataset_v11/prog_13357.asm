; DESCRIPTION: Places a black line segment connecting (147, 247) to (67, 165).
; PLAN: r0=147(x1), r1=247(y1), r2=67(x2), r3=165(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 247
LDI r2, 67
LDI r3, 165
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
