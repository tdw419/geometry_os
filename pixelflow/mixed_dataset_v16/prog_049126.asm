; DESCRIPTION: Draws a black line from (256, 105) to (86, 188).
; PLAN: r0=256(x1), r1=105(y1), r2=86(x2), r3=188(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 105
LDI r2, 86
LDI r3, 188
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
