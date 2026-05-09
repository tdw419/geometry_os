; DESCRIPTION: Places a red line segment connecting (496, 241) to (337, 175).
; PLAN: r0=496(x1), r1=241(y1), r2=337(x2), r3=175(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 241
LDI r2, 337
LDI r3, 175
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
