; DESCRIPTION: Draws a black line from (53, 179) to (24, 54).
; PLAN: r0=53(x1), r1=179(y1), r2=24(x2), r3=54(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 179
LDI r2, 24
LDI r3, 54
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
