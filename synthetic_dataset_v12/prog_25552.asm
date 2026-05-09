; DESCRIPTION: Draws a yellow line from (159, 166) to (139, 18).
; PLAN: r0=159(x1), r1=166(y1), r2=139(x2), r3=18(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 166
LDI r2, 139
LDI r3, 18
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
