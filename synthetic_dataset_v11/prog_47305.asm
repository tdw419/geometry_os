; DESCRIPTION: Composite: . Then Renders a blue box of size 114x56 starting at (67, 82). Then Creates a purple circular shape at (74, 137) with radius 33.
; PLAN: r0=67(x), r1=82(y), r2=114(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=74(x), r1=137(y), r2=33(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a blue box of size 114x56 starting at (67, 82).
; PLAN: r0=67(x), r1=82(y), r2=114(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 82
LDI r2, 114
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a purple circular shape at (74, 137) with radius 33.
; PLAN: r0=74(x), r1=137(y), r2=33(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 137
LDI r2, 33
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
