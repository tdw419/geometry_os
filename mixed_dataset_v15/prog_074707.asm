; DESCRIPTION: Draws a black line from (302, 242) to (390, 104).
; PLAN: r0=302(x1), r1=242(y1), r2=390(x2), r3=104(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 242
LDI r2, 390
LDI r3, 104
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
