; DESCRIPTION: Draws a black line from (431, 138) to (432, 163).
; PLAN: r0=431(x1), r1=138(y1), r2=432(x2), r3=163(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 138
LDI r2, 432
LDI r3, 163
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
