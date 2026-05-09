; DESCRIPTION: Composite: . Then Creates a orange circular shape at (119, 185) with radius 35. Then Renders a purple box of size 62x61 starting at (53, 124).
; PLAN: r0=119(x), r1=185(y), r2=35(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=53(x), r1=124(y), r2=62(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a orange circular shape at (119, 185) with radius 35.
; PLAN: r0=119(x), r1=185(y), r2=35(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 185
LDI r2, 35
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a purple box of size 62x61 starting at (53, 124).
; PLAN: r0=53(x), r1=124(y), r2=62(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 124
LDI r2, 62
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
