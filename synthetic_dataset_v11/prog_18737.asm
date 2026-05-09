; DESCRIPTION: Places a black line segment connecting (49, 246) to (242, 145).
; PLAN: r0=49(x1), r1=246(y1), r2=242(x2), r3=145(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 246
LDI r2, 242
LDI r3, 145
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
