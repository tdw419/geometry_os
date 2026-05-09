; DESCRIPTION: Places a black line segment connecting (65, 53) to (15, 229).
; PLAN: r0=65(x1), r1=53(y1), r2=15(x2), r3=229(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 53
LDI r2, 15
LDI r3, 229
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
