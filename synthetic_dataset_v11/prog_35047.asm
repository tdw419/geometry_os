; DESCRIPTION: Composite: . Then Renders a yellow line between points (134, 153) and (144, 126). Then Places a magenta circle of radius 53 at center (101, 130).
; PLAN: r0=134(x1), r1=153(y1), r2=144(x2), r3=126(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=101(x), r1=130(y), r2=53(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a yellow line between points (134, 153) and (144, 126).
; PLAN: r0=134(x1), r1=153(y1), r2=144(x2), r3=126(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 153
LDI r2, 144
LDI r3, 126
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta circle of radius 53 at center (101, 130).
; PLAN: r0=101(x), r1=130(y), r2=53(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 130
LDI r2, 53
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
