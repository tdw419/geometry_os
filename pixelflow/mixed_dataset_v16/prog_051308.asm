; DESCRIPTION: Draws a black line from (31, 189) to (473, 74).
; PLAN: r0=31(x1), r1=189(y1), r2=473(x2), r3=74(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 189
LDI r2, 473
LDI r3, 74
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
