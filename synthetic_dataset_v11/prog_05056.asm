; DESCRIPTION: Composite: . Then Renders a blue box of size 69x86 starting at (106, 147). Then Places a magenta circle of radius 31 at center (161, 101).
; PLAN: r0=106(x), r1=147(y), r2=69(width), r3=86(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=161(x), r1=101(y), r2=31(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a blue box of size 69x86 starting at (106, 147).
; PLAN: r0=106(x), r1=147(y), r2=69(width), r3=86(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 147
LDI r2, 69
LDI r3, 86
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta circle of radius 31 at center (161, 101).
; PLAN: r0=161(x), r1=101(y), r2=31(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 101
LDI r2, 31
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
