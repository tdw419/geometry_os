; DESCRIPTION: Places a black line segment connecting (118, 46) to (346, 245).
; PLAN: r0=118(x1), r1=46(y1), r2=346(x2), r3=245(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 46
LDI r2, 346
LDI r3, 245
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
