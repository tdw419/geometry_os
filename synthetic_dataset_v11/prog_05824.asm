; DESCRIPTION: Draws a black line from (11, 241) to (104, 7).
; PLAN: r0=11(x1), r1=241(y1), r2=104(x2), r3=7(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 241
LDI r2, 104
LDI r3, 7
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
