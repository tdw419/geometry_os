; DESCRIPTION: Draws a black line from (347, 109) to (1, 175).
; PLAN: r0=347(x1), r1=109(y1), r2=1(x2), r3=175(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 109
LDI r2, 1
LDI r3, 175
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
