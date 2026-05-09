; DESCRIPTION: Composite: . Then Draws a purple line from (72, 49) to (184, 247). Then Draws a blue circle centered at (109, 114) with radius 47.
; PLAN: r0=72(x1), r1=49(y1), r2=184(x2), r3=247(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=109(x), r1=114(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a purple line from (72, 49) to (184, 247).
; PLAN: r0=72(x1), r1=49(y1), r2=184(x2), r3=247(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 49
LDI r2, 184
LDI r3, 247
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a blue circle centered at (109, 114) with radius 47.
; PLAN: r0=109(x), r1=114(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 114
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
