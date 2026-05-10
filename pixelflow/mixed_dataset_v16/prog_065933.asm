; DESCRIPTION: Draws a yellow line from (358, 29) to (281, 151).
; PLAN: r0=358(x1), r1=29(y1), r2=281(x2), r3=151(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 29
LDI r2, 281
LDI r3, 151
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
