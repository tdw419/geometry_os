; DESCRIPTION: Places a black line segment connecting (268, 38) to (162, 45).
; PLAN: r0=268(x1), r1=38(y1), r2=162(x2), r3=45(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 38
LDI r2, 162
LDI r3, 45
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
