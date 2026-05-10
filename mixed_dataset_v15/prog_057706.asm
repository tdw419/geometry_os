; DESCRIPTION: Draws a green line from (49, 118) to (490, 43).
; PLAN: r0=49(x1), r1=118(y1), r2=490(x2), r3=43(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 118
LDI r2, 490
LDI r3, 43
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
