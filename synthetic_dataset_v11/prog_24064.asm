; DESCRIPTION: Composite: . Then Renders a black box of size 69x66 starting at (64, 50). Then Creates a black circular shape at (114, 111) with radius 73.
; PLAN: r0=64(x), r1=50(y), r2=69(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=114(x), r1=111(y), r2=73(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a black box of size 69x66 starting at (64, 50).
; PLAN: r0=64(x), r1=50(y), r2=69(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 50
LDI r2, 69
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a black circular shape at (114, 111) with radius 73.
; PLAN: r0=114(x), r1=111(y), r2=73(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 111
LDI r2, 73
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
