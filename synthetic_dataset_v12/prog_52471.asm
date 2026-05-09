; DESCRIPTION: Places a black line segment connecting (344, 10) to (241, 140).
; PLAN: r0=344(x1), r1=10(y1), r2=241(x2), r3=140(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 10
LDI r2, 241
LDI r3, 140
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
