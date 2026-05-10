; DESCRIPTION: Draws a magenta line from (319, 114) to (301, 105).
; PLAN: r0=319(x1), r1=114(y1), r2=301(x2), r3=105(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 114
LDI r2, 301
LDI r3, 105
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
