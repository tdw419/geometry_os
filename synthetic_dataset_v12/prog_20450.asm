; DESCRIPTION: Draws a black line from (300, 115) to (222, 104).
; PLAN: r0=300(x1), r1=115(y1), r2=222(x2), r3=104(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 115
LDI r2, 222
LDI r3, 104
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
