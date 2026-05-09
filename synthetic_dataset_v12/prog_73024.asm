; DESCRIPTION: Draws a purple line from (490, 183) to (187, 77).
; PLAN: r0=490(x1), r1=183(y1), r2=187(x2), r3=77(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 183
LDI r2, 187
LDI r3, 77
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
