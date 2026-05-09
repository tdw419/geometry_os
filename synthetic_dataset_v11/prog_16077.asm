; DESCRIPTION: Composite: . Then Creates a black circular shape at (119, 76) with radius 48. Then Renders a blue box of size 104x57 starting at (81, 198).
; PLAN: r0=119(x), r1=76(y), r2=48(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=81(x), r1=198(y), r2=104(width), r3=57(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a black circular shape at (119, 76) with radius 48.
; PLAN: r0=119(x), r1=76(y), r2=48(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 76
LDI r2, 48
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a blue box of size 104x57 starting at (81, 198).
; PLAN: r0=81(x), r1=198(y), r2=104(width), r3=57(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 198
LDI r2, 104
LDI r3, 57
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
