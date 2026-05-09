; DESCRIPTION: Draws a yellow line from (98, 158) to (343, 3).
; PLAN: r0=98(x1), r1=158(y1), r2=343(x2), r3=3(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 158
LDI r2, 343
LDI r3, 3
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
