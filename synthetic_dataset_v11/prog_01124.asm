; DESCRIPTION: Draws a black line from (53, 101) to (148, 3).
; PLAN: r0=53(x1), r1=101(y1), r2=148(x2), r3=3(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 101
LDI r2, 148
LDI r3, 3
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
