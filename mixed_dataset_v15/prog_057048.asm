; DESCRIPTION: Draws a black line from (96, 104) to (211, 202).
; PLAN: r0=96(x1), r1=104(y1), r2=211(x2), r3=202(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 104
LDI r2, 211
LDI r3, 202
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
