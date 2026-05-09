; DESCRIPTION: Composite: . Then Draws a orange circle centered at (77, 154) with radius 52. Then Draws a white rectangle at (114, 110) with width 66 and height 13.
; PLAN: r0=77(x), r1=154(y), r2=52(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=114(x), r1=110(y), r2=66(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a orange circle centered at (77, 154) with radius 52.
; PLAN: r0=77(x), r1=154(y), r2=52(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 154
LDI r2, 52
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a white rectangle at (114, 110) with width 66 and height 13.
; PLAN: r0=114(x), r1=110(y), r2=66(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 110
LDI r2, 66
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
