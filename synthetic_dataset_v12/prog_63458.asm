; DESCRIPTION: Places a black line segment connecting (380, 158) to (354, 72).
; PLAN: r0=380(x1), r1=158(y1), r2=354(x2), r3=72(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 158
LDI r2, 354
LDI r3, 72
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
