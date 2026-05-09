; DESCRIPTION: Draws a green line from (129, 104) to (219, 4).
; PLAN: r0=129(x1), r1=104(y1), r2=219(x2), r3=4(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 104
LDI r2, 219
LDI r3, 4
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
