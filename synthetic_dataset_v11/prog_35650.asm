; DESCRIPTION: Composite: . Then Places a purple 55x76 rectangle at position (58, 134). Then Creates a white circular shape at (129, 175) with radius 67.
; PLAN: r0=58(x), r1=134(y), r2=55(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=129(x), r1=175(y), r2=67(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a purple 55x76 rectangle at position (58, 134).
; PLAN: r0=58(x), r1=134(y), r2=55(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 134
LDI r2, 55
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a white circular shape at (129, 175) with radius 67.
; PLAN: r0=129(x), r1=175(y), r2=67(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 175
LDI r2, 67
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
