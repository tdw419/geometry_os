; DESCRIPTION: Composite: . Then Draws a red rectangle at (71, 142) with width 88 and height 45. Then Creates a white circular shape at (134, 149) with radius 77.
; PLAN: r0=71(x), r1=142(y), r2=88(width), r3=45(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=134(x), r1=149(y), r2=77(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a red rectangle at (71, 142) with width 88 and height 45.
; PLAN: r0=71(x), r1=142(y), r2=88(width), r3=45(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 142
LDI r2, 88
LDI r3, 45
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a white circular shape at (134, 149) with radius 77.
; PLAN: r0=134(x), r1=149(y), r2=77(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 149
LDI r2, 77
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
