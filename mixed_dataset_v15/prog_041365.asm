; DESCRIPTION: Draws a black line from (246, 136) to (456, 119).
; PLAN: r0=246(x1), r1=136(y1), r2=456(x2), r3=119(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 136
LDI r2, 456
LDI r3, 119
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
