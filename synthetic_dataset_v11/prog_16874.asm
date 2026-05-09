; DESCRIPTION: Composite: . Then Places a orange 36x28 rectangle at position (191, 136). Then Creates a black circular shape at (129, 130) with radius 67.
; PLAN: r0=191(x), r1=136(y), r2=36(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=129(x), r1=130(y), r2=67(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a orange 36x28 rectangle at position (191, 136).
; PLAN: r0=191(x), r1=136(y), r2=36(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 136
LDI r2, 36
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a black circular shape at (129, 130) with radius 67.
; PLAN: r0=129(x), r1=130(y), r2=67(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 130
LDI r2, 67
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
