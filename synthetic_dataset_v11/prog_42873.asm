; DESCRIPTION: Composite: . Then Draws a red rectangle at (42, 150) with width 20 and height 67. Then Creates a blue circular shape at (164, 45) with radius 44.
; PLAN: r0=42(x), r1=150(y), r2=20(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=164(x), r1=45(y), r2=44(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a red rectangle at (42, 150) with width 20 and height 67.
; PLAN: r0=42(x), r1=150(y), r2=20(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 150
LDI r2, 20
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a blue circular shape at (164, 45) with radius 44.
; PLAN: r0=164(x), r1=45(y), r2=44(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 45
LDI r2, 44
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
