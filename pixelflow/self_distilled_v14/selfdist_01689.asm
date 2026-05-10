; DESCRIPTION: Draws a yellow line from (11, 159) to (249, 53).
; PLAN: r0=11(x1), r1=159(y1), r2=249(x2), r3=53(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 159
LDI r2, 249
LDI r3, 53
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
