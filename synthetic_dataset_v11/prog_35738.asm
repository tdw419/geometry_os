; DESCRIPTION: Composite: . Then Draws a black rectangle at (215, 83) with width 40 and height 15. Then Creates a yellow circular shape at (93, 101) with radius 37.
; PLAN: r0=215(x), r1=83(y), r2=40(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=93(x), r1=101(y), r2=37(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a black rectangle at (215, 83) with width 40 and height 15.
; PLAN: r0=215(x), r1=83(y), r2=40(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 83
LDI r2, 40
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a yellow circular shape at (93, 101) with radius 37.
; PLAN: r0=93(x), r1=101(y), r2=37(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 93
LDI r1, 101
LDI r2, 37
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
