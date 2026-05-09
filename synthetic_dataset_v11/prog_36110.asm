; DESCRIPTION: Composite: . Then Draws a blue circle centered at (83, 110) with radius 39. Then Renders a black box of size 45x61 starting at (3, 178).
; PLAN: r0=83(x), r1=110(y), r2=39(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=3(x), r1=178(y), r2=45(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a blue circle centered at (83, 110) with radius 39.
; PLAN: r0=83(x), r1=110(y), r2=39(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 110
LDI r2, 39
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a black box of size 45x61 starting at (3, 178).
; PLAN: r0=3(x), r1=178(y), r2=45(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 178
LDI r2, 45
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
