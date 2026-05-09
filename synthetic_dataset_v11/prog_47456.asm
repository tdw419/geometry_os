; DESCRIPTION: Composite: . Then Draws a purple line from (202, 142) to (41, 101). Then Draws a magenta circle centered at (94, 79) with radius 58.
; PLAN: r0=202(x1), r1=142(y1), r2=41(x2), r3=101(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=94(x), r1=79(y), r2=58(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a purple line from (202, 142) to (41, 101).
; PLAN: r0=202(x1), r1=142(y1), r2=41(x2), r3=101(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 142
LDI r2, 41
LDI r3, 101
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a magenta circle centered at (94, 79) with radius 58.
; PLAN: r0=94(x), r1=79(y), r2=58(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 79
LDI r2, 58
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
