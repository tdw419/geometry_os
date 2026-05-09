; DESCRIPTION: Draws a yellow line from (274, 251) to (1, 217).
; PLAN: r0=274(x1), r1=251(y1), r2=1(x2), r3=217(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 251
LDI r2, 1
LDI r3, 217
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
