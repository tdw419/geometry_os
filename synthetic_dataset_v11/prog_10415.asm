; DESCRIPTION: Composite: . Then Renders a purple box of size 100x30 starting at (108, 69). Then Creates a yellow circular shape at (68, 81) with radius 28.
; PLAN: r0=108(x), r1=69(y), r2=100(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=68(x), r1=81(y), r2=28(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a purple box of size 100x30 starting at (108, 69).
; PLAN: r0=108(x), r1=69(y), r2=100(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 69
LDI r2, 100
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a yellow circular shape at (68, 81) with radius 28.
; PLAN: r0=68(x), r1=81(y), r2=28(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 68
LDI r1, 81
LDI r2, 28
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
