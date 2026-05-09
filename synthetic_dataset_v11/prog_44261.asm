; DESCRIPTION: Composite: . Then Renders a white disk with center (160, 52) and radius 42. Then Draws a red rectangle at (75, 49) with width 39 and height 106.
; PLAN: r0=160(x), r1=52(y), r2=42(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=75(x), r1=49(y), r2=39(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a white disk with center (160, 52) and radius 42.
; PLAN: r0=160(x), r1=52(y), r2=42(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 160
LDI r1, 52
LDI r2, 42
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a red rectangle at (75, 49) with width 39 and height 106.
; PLAN: r0=75(x), r1=49(y), r2=39(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 49
LDI r2, 39
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
