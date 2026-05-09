; DESCRIPTION: Draws a black line from (62, 34) to (358, 151).
; PLAN: r0=62(x1), r1=34(y1), r2=358(x2), r3=151(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 34
LDI r2, 358
LDI r3, 151
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
