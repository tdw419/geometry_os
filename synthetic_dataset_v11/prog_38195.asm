; DESCRIPTION: Composite: . Then Renders a black disk with center (128, 42) and radius 27. Then Draws a green rectangle at (136, 15) with width 50 and height 28.
; PLAN: r0=128(x), r1=42(y), r2=27(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=136(x), r1=15(y), r2=50(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a black disk with center (128, 42) and radius 27.
; PLAN: r0=128(x), r1=42(y), r2=27(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 42
LDI r2, 27
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a green rectangle at (136, 15) with width 50 and height 28.
; PLAN: r0=136(x), r1=15(y), r2=50(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 15
LDI r2, 50
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
