; DESCRIPTION: Renders a black line between points (79, 136) and (456, 128).
; PLAN: r0=79(x1), r1=136(y1), r2=456(x2), r3=128(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 136
LDI r2, 456
LDI r3, 128
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
