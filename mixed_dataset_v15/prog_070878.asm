; DESCRIPTION: Draws a yellow line from (505, 47) to (10, 151).
; PLAN: r0=505(x1), r1=47(y1), r2=10(x2), r3=151(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 47
LDI r2, 10
LDI r3, 151
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
