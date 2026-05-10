; DESCRIPTION: Places a black line segment connecting (437, 172) to (26, 191).
; PLAN: r0=437(x1), r1=172(y1), r2=26(x2), r3=191(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 172
LDI r2, 26
LDI r3, 191
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
