; DESCRIPTION: Draws a black line from (109, 104) to (176, 184).
; PLAN: r0=109(x1), r1=104(y1), r2=176(x2), r3=184(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 104
LDI r2, 176
LDI r3, 184
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
