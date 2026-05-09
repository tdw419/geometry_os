; DESCRIPTION: Composite: . Then Renders a black disk with center (109, 130) and radius 61. Then Renders a red box of size 109x58 starting at (95, 151).
; PLAN: r0=109(x), r1=130(y), r2=61(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=95(x), r1=151(y), r2=109(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a black disk with center (109, 130) and radius 61.
; PLAN: r0=109(x), r1=130(y), r2=61(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 130
LDI r2, 61
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a red box of size 109x58 starting at (95, 151).
; PLAN: r0=95(x), r1=151(y), r2=109(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 151
LDI r2, 109
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
