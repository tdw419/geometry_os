; DESCRIPTION: Draws a black line from (500, 104) to (161, 115).
; PLAN: r0=500(x1), r1=104(y1), r2=161(x2), r3=115(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 104
LDI r2, 161
LDI r3, 115
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
