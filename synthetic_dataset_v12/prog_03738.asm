; DESCRIPTION: Places a black line segment connecting (483, 8) to (154, 9).
; PLAN: r0=483(x1), r1=8(y1), r2=154(x2), r3=9(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 8
LDI r2, 154
LDI r3, 9
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
