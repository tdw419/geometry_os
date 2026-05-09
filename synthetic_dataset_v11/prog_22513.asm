; DESCRIPTION: Composite: . Then Draws a magenta circle centered at (224, 19) with radius 14. Then Draws a blue rectangle at (1, 45) with width 39 and height 12.
; PLAN: r0=224(x), r1=19(y), r2=14(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=1(x), r1=45(y), r2=39(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a magenta circle centered at (224, 19) with radius 14.
; PLAN: r0=224(x), r1=19(y), r2=14(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 224
LDI r1, 19
LDI r2, 14
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a blue rectangle at (1, 45) with width 39 and height 12.
; PLAN: r0=1(x), r1=45(y), r2=39(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 45
LDI r2, 39
LDI r3, 12
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
