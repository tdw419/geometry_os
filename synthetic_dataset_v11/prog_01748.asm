; DESCRIPTION: Composite: . Then Creates a red circular shape at (122, 98) with radius 49. Then Draws a purple rectangle at (69, 105) with width 96 and height 79.
; PLAN: r0=122(x), r1=98(y), r2=49(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=69(x), r1=105(y), r2=96(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a red circular shape at (122, 98) with radius 49.
; PLAN: r0=122(x), r1=98(y), r2=49(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 98
LDI r2, 49
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a purple rectangle at (69, 105) with width 96 and height 79.
; PLAN: r0=69(x), r1=105(y), r2=96(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 105
LDI r2, 96
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
