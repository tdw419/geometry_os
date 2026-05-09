; DESCRIPTION: Composite: . Then Draws a black rectangle at (93, 79) with width 112 and height 50. Then Creates a white circular shape at (185, 174) with radius 35.
; PLAN: r0=93(x), r1=79(y), r2=112(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=185(x), r1=174(y), r2=35(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a black rectangle at (93, 79) with width 112 and height 50.
; PLAN: r0=93(x), r1=79(y), r2=112(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 79
LDI r2, 112
LDI r3, 50
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a white circular shape at (185, 174) with radius 35.
; PLAN: r0=185(x), r1=174(y), r2=35(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 174
LDI r2, 35
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
