; DESCRIPTION: Draws a black line from (93, 60) to (53, 58).
; PLAN: r0=93(x1), r1=60(y1), r2=53(x2), r3=58(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 60
LDI r2, 53
LDI r3, 58
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
