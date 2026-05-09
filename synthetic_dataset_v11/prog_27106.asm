; DESCRIPTION: Composite: . Then Draws a cyan rectangle at (47, 78) with width 76 and height 73. Then Creates a white circular shape at (184, 117) with radius 31.
; PLAN: r0=47(x), r1=78(y), r2=76(width), r3=73(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=184(x), r1=117(y), r2=31(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a cyan rectangle at (47, 78) with width 76 and height 73.
; PLAN: r0=47(x), r1=78(y), r2=76(width), r3=73(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 78
LDI r2, 76
LDI r3, 73
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a white circular shape at (184, 117) with radius 31.
; PLAN: r0=184(x), r1=117(y), r2=31(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 184
LDI r1, 117
LDI r2, 31
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
