; DESCRIPTION: Places a black line segment connecting (445, 227) to (109, 74).
; PLAN: r0=445(x1), r1=227(y1), r2=109(x2), r3=74(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 227
LDI r2, 109
LDI r3, 74
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
