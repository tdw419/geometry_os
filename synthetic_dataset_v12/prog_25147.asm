; DESCRIPTION: Places a yellow line segment connecting (338, 107) to (14, 247).
; PLAN: r0=338(x1), r1=107(y1), r2=14(x2), r3=247(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 107
LDI r2, 14
LDI r3, 247
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
