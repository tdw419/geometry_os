; DESCRIPTION: Composite: . Then Draws a magenta rectangle at (184, 18) with width 20 and height 84. Then Creates a white circular shape at (115, 154) with radius 65.
; PLAN: r0=184(x), r1=18(y), r2=20(width), r3=84(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=115(x), r1=154(y), r2=65(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a magenta rectangle at (184, 18) with width 20 and height 84.
; PLAN: r0=184(x), r1=18(y), r2=20(width), r3=84(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 18
LDI r2, 20
LDI r3, 84
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a white circular shape at (115, 154) with radius 65.
; PLAN: r0=115(x), r1=154(y), r2=65(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 154
LDI r2, 65
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
