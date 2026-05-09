; DESCRIPTION: Draws a blue line from (114, 43) to (380, 151).
; PLAN: r0=114(x1), r1=43(y1), r2=380(x2), r3=151(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 43
LDI r2, 380
LDI r3, 151
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
