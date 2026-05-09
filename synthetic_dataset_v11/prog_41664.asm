; DESCRIPTION: Composite: . Then Creates a purple circular shape at (164, 126) with radius 67. Then Creates a purple rectangular region at (33, 103) spanning 74 by 86 pixels.
; PLAN: r0=164(x), r1=126(y), r2=67(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=33(x), r1=103(y), r2=74(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a purple circular shape at (164, 126) with radius 67.
; PLAN: r0=164(x), r1=126(y), r2=67(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 126
LDI r2, 67
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a purple rectangular region at (33, 103) spanning 74 by 86 pixels.
; PLAN: r0=33(x), r1=103(y), r2=74(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 103
LDI r2, 74
LDI r3, 86
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
