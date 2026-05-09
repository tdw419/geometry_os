; DESCRIPTION: Draws a magenta line from (219, 248) to (192, 151).
; PLAN: r0=219(x1), r1=248(y1), r2=192(x2), r3=151(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 248
LDI r2, 192
LDI r3, 151
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
