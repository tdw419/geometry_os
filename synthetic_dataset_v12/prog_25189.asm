; DESCRIPTION: Draws a black line from (37, 104) to (85, 45).
; PLAN: r0=37(x1), r1=104(y1), r2=85(x2), r3=45(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 104
LDI r2, 85
LDI r3, 45
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
