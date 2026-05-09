; DESCRIPTION: Draws a black line from (139, 131) to (66, 116).
; PLAN: r0=139(x1), r1=131(y1), r2=66(x2), r3=116(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 131
LDI r2, 66
LDI r3, 116
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
