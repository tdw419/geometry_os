; DESCRIPTION: Draws a black line from (241, 14) to (153, 131).
; PLAN: r0=241(x1), r1=14(y1), r2=153(x2), r3=131(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 14
LDI r2, 153
LDI r3, 131
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
