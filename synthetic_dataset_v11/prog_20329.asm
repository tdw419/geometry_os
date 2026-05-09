; DESCRIPTION: Composite: . Then Draws a magenta circle centered at (141, 179) with radius 76. Then Renders a purple box of size 90x98 starting at (158, 11).
; PLAN: r0=141(x), r1=179(y), r2=76(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=158(x), r1=11(y), r2=90(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a magenta circle centered at (141, 179) with radius 76.
; PLAN: r0=141(x), r1=179(y), r2=76(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 179
LDI r2, 76
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a purple box of size 90x98 starting at (158, 11).
; PLAN: r0=158(x), r1=11(y), r2=90(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 11
LDI r2, 90
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
