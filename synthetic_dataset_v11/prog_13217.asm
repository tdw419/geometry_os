; DESCRIPTION: Composite: . Then Renders a blue box of size 53x117 starting at (121, 136). Then Draws a black circle centered at (100, 182) with radius 26.
; PLAN: r0=121(x), r1=136(y), r2=53(width), r3=117(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=100(x), r1=182(y), r2=26(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a blue box of size 53x117 starting at (121, 136).
; PLAN: r0=121(x), r1=136(y), r2=53(width), r3=117(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 136
LDI r2, 53
LDI r3, 117
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a black circle centered at (100, 182) with radius 26.
; PLAN: r0=100(x), r1=182(y), r2=26(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 182
LDI r2, 26
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
