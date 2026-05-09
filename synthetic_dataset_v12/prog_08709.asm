; DESCRIPTION: Draws a red line from (16, 165) to (226, 151).
; PLAN: r0=16(x1), r1=165(y1), r2=226(x2), r3=151(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 165
LDI r2, 226
LDI r3, 151
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
