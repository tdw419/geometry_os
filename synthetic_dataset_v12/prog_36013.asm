; DESCRIPTION: Draws a magenta line from (5, 66) to (44, 151).
; PLAN: r0=5(x1), r1=66(y1), r2=44(x2), r3=151(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 66
LDI r2, 44
LDI r3, 151
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
