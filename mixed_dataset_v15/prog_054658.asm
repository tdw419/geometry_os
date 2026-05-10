; DESCRIPTION: Draws a black line from (175, 101) to (153, 204).
; PLAN: r0=175(x1), r1=101(y1), r2=153(x2), r3=204(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 101
LDI r2, 153
LDI r3, 204
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
