; DESCRIPTION: Composite: . Then Places a purple line segment connecting (217, 166) to (63, 68). Then Places a magenta circle of radius 73 at center (114, 130).
; PLAN: r0=217(x1), r1=166(y1), r2=63(x2), r3=68(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=114(x), r1=130(y), r2=73(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a purple line segment connecting (217, 166) to (63, 68).
; PLAN: r0=217(x1), r1=166(y1), r2=63(x2), r3=68(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 166
LDI r2, 63
LDI r3, 68
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta circle of radius 73 at center (114, 130).
; PLAN: r0=114(x), r1=130(y), r2=73(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 130
LDI r2, 73
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
