; DESCRIPTION: Draws a black line from (246, 160) to (79, 151).
; PLAN: r0=246(x1), r1=160(y1), r2=79(x2), r3=151(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 160
LDI r2, 79
LDI r3, 151
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
