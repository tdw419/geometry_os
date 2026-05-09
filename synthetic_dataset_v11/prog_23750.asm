; DESCRIPTION: Composite: . Then Creates a white circular shape at (189, 155) with radius 42. Then Draws a cyan rectangle at (10, 32) with width 114 and height 52.
; PLAN: r0=189(x), r1=155(y), r2=42(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=10(x), r1=32(y), r2=114(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a white circular shape at (189, 155) with radius 42.
; PLAN: r0=189(x), r1=155(y), r2=42(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 189
LDI r1, 155
LDI r2, 42
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a cyan rectangle at (10, 32) with width 114 and height 52.
; PLAN: r0=10(x), r1=32(y), r2=114(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 32
LDI r2, 114
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
