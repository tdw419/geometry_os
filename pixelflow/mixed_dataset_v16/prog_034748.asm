; DESCRIPTION: Draws a red line from (170, 84) to (466, 151).
; PLAN: r0=170(x1), r1=84(y1), r2=466(x2), r3=151(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 84
LDI r2, 466
LDI r3, 151
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
