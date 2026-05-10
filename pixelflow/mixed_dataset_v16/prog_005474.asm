; DESCRIPTION: Draws a magenta line from (319, 6) to (277, 151).
; PLAN: r0=319(x1), r1=6(y1), r2=277(x2), r3=151(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 6
LDI r2, 277
LDI r3, 151
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
