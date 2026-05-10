; DESCRIPTION: Places a black line segment connecting (437, 205) to (430, 181).
; PLAN: r0=437(x1), r1=205(y1), r2=430(x2), r3=181(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 205
LDI r2, 430
LDI r3, 181
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
