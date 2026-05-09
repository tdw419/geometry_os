; DESCRIPTION: Composite: . Then Draws a white rectangle at (42, 54) with width 76 and height 36. Then Creates a blue circular shape at (96, 110) with radius 66.
; PLAN: r0=42(x), r1=54(y), r2=76(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=96(x), r1=110(y), r2=66(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a white rectangle at (42, 54) with width 76 and height 36.
; PLAN: r0=42(x), r1=54(y), r2=76(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 54
LDI r2, 76
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a blue circular shape at (96, 110) with radius 66.
; PLAN: r0=96(x), r1=110(y), r2=66(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 110
LDI r2, 66
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
