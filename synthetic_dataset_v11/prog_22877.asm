; DESCRIPTION: Draws a black line from (128, 119) to (136, 141).
; PLAN: r0=128(x1), r1=119(y1), r2=136(x2), r3=141(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 119
LDI r2, 136
LDI r3, 141
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
