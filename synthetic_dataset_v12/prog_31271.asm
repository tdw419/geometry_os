; DESCRIPTION: Draws a black line from (101, 101) to (461, 183).
; PLAN: r0=101(x1), r1=101(y1), r2=461(x2), r3=183(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 101
LDI r2, 461
LDI r3, 183
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
