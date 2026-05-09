; DESCRIPTION: Draws a yellow line from (159, 158) to (32, 19).
; PLAN: r0=159(x1), r1=158(y1), r2=32(x2), r3=19(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 158
LDI r2, 32
LDI r3, 19
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
