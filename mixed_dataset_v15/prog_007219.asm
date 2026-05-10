; DESCRIPTION: Draws a black line from (389, 101) to (511, 58).
; PLAN: r0=389(x1), r1=101(y1), r2=511(x2), r3=58(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 101
LDI r2, 511
LDI r3, 58
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
