; DESCRIPTION: Draws a magenta line from (47, 234) to (299, 151).
; PLAN: r0=47(x1), r1=234(y1), r2=299(x2), r3=151(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 234
LDI r2, 299
LDI r3, 151
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
