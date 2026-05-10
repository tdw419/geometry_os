; DESCRIPTION: Renders a yellow rectangular region spanning 78 by 14 at (257, 69).
; PLAN: r0=257(x), r1=69(y), r2=78(width), r3=14(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 69
LDI r2, 78
LDI r3, 14
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
