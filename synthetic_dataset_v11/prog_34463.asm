; DESCRIPTION: Draws a purple line from (127, 219) to (212, 151).
; PLAN: r0=127(x1), r1=219(y1), r2=212(x2), r3=151(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 219
LDI r2, 212
LDI r3, 151
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
