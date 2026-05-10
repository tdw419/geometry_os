; DESCRIPTION: Draws a black line from (486, 1) to (241, 90).
; PLAN: r0=486(x1), r1=1(y1), r2=241(x2), r3=90(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 1
LDI r2, 241
LDI r3, 90
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
